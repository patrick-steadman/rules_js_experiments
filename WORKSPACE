workspace(
    name = "rules_js_experiments",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "aspect_rules_ts",
    sha256 = "3eb3171c26eb5d0951d51ae594695397218fb829e3798eea5557814723a1b3da",
    strip_prefix = "rules_ts-1.0.0-rc3",
    url = "https://github.com/aspect-build/rules_ts/archive/refs/tags/v1.0.0-rc3.tar.gz",
)

##################
# rules_ts setup #
##################
# Fetches the rules_ts dependencies.
# If you want to have a different version of some dependency,
# you should fetch it *before* calling this.
# Alternatively, you can skip calling this function, so long as you've
# already fetched all the dependencies.
load("@aspect_rules_ts//ts:repositories.bzl", "LATEST_VERSION", "rules_ts_dependencies")

rules_ts_dependencies(ts_version = LATEST_VERSION)

# Fetch and register node, if you haven't already
load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "node",
    node_version = DEFAULT_NODE_VERSION,
)

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")

npm_translate_lock(
    name = "npm",
    pnpm_lock = "//:pnpm-lock.yaml",
    verify_node_modules_ignored = "//:.bazelignore",
)

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()

http_archive(
    name = "aspect_rules_jest",
    sha256 = "bb3226707f9872185865a6381eb3a19311ca7b46e8ed475aad50975906a6cb6a",
    strip_prefix = "rules_jest-0.10.0",
    url = "https://github.com/aspect-build/rules_jest/archive/refs/tags/v0.10.0.tar.gz",
)

load("@aspect_rules_jest//jest:dependencies.bzl", "rules_jest_dependencies")

rules_jest_dependencies()

# Fetches the npm packages for jest-cli.
load("@aspect_rules_jest//jest:repositories.bzl", "LATEST_VERSION", "jest_repositories")

jest_repositories(
    name = "jest",
    jest_version = LATEST_VERSION,
)
