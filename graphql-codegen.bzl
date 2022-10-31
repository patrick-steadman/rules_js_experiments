"GraphQL code generation macro"

# from https://github.com/aspect-build/rules_js/issues/227#issuecomment-1278272767

load("@aspect_rules_js//js:defs.bzl", "js_run_binary")
load("@aspect_rules_ts//ts:defs.bzl", "ts_project")

def _gqlgen_params_impl(ctx):
    params = {
        "config": json.decode(ctx.attr.config),
        "schemas": [],
        "target": ctx.attr.target,
    }
    for s in ctx.files.schemas:
        list = params["schemas"]
        list.append("../../../%s" % s.path)
    ctx.actions.write(
        output = ctx.outputs.out,
        content = json.encode(params),
        is_executable = False,
    )
    return [DefaultInfo(files = depset(direct = [ctx.outputs.out]))]

_gqlgen_params = rule(
    implementation = _gqlgen_params_impl,
    attrs = {
        "config": attr.string(mandatory = True),
        "out": attr.output(mandatory = True),
        "schemas": attr.label(allow_files = [".graphql"]),
        "target": attr.string(mandatory = True),
    },
)

def gqlgen(name, schemas, out, config, **kwargs):
    """GraphQL code generation

    A single file is generated from the specified schemas and configuration.

    Args:
        name: The name of the rule
        schemas: The schema and operation GraphQL files
        out: The name of the generated file
        config: The configuration for the generated file as a dict
        **kwargs: Remaining arguments passed to the inner `js_run_binary` rule
    """
    if type(config) != type(dict()):
        fail("the config attribute must be a dict")
    params = name + "_params"
    _gqlgen_params(
        name = params,
        schemas = schemas,
        target = "{prefix}/{file}".format(
            prefix = native.package_name(),
            file = out,
        ) if native.package_name() else out,
        config = json.encode(config),
        out = params + ".json",
    )
    js_run_binary(
        name = name,
        srcs = [schemas, params],
        outs = [out],
        args = ["$(rootpath %s)" % params],
        tool = "//:launcher",
        # Uncomment to debug @graphql-codegen/cli loading plugins:
        # env = {
        #     "JS_BINARY__LOG_DEBUG": "1",
        #     "JS_BINARY__LOG_INFO": "1",
        #     "NODE_DEBUG": "module",
        # },
        **kwargs
    )
    ts_project(
        name = "%s_ts" % name,
        srcs = [out],
        declaration = True,
    )
