# rules_js_experiments

`bazel info bazel-bin`

`bazel build --sandbox_debug -s --verbose_failures gen`

This is an example demonstrating correct functionality of:
- `graphql-codegen`
- `tsc`
- `jest_test`
- `ts_project`
- `pnpm`
- relative `import`/`export`

TODO:
- bazel intellij indexing without node_modules in root
- gRPC/protobuf
- jest mocks
- `import` from `node_modules`
- monorepo absolute path `import`
- confirm editor support for `node_modules` types


# How to add new dependencies

1. Install correct nodejs version
2. Install `pnpm` using npm: `npm i -g pnpm`
3. Run `pnpm add foo`
