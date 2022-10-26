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
