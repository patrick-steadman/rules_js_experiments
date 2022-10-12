def _generate_config_impl(ctx):
    output = ctx.actions.declare_file(ctx.label.name + "-codegen.yml")
    ctx.actions.expand_template(
        template = ctx.file._types_template_file,
        output = output,
        substitutions = {
            "__OUTPATH__": ctx.var["BINDIR"],
        },
    )

    return [DefaultInfo(files = depset([output]))]

generate_config = rule(
    _generate_config_impl,
    attrs = {
        "_types_template_file": attr.label(
            default = "//:codegen-template.yml",
            allow_single_file = True,
        ),
    },
)
