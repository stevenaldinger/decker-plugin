# Quick start

1. `make docker_run`
2. `make build_plugin`
3. `make run`
4. `cat /tmp/reports/decker-plugin.report.txt`

# Directory structure

```
.
├── build
│   └── package
│       └── Dockerfile
├── cmd
│   └── decker-plugin
│       └── main.go
├── decker-plugin.hcl
├── examples
│   └── plugin-schema-test.hcl
├── Makefile
└── README.md
```

- [cmd/decker-plugin/main.go](cmd/decker-plugin/main.go) contains the "Hello World" plugin code. This is a working plugin that can be compiled and run immediately to get a feel for what's happening. If you make changes to expected inputs in [decker-plugin.hcl](decker-plugin.hcl), be sure to make changes in [examples/plugin-test.hcl](examples/plugin-test.hcl) as well to set values to the inputs. These will be available in [main.go](cmd/decker-plugin/main.go) in the `inputsMap` as `myNewVariable := (*inputsMap)["my_decker_variable_name"]`. Anything assigned to `(*resultsMap)["raw_output"]` will be written to a report file at `/tmp/reports/decker-plugin.report.txt`.
- [decker-plugin.hcl](decker-plugin.hcl) declares the inputs that your plugin expects to have configured by the user.
- [examples/plugin-test.hcl](examples/plugin-test.hcl) is a simple [decker](https://github.com/stevenaldinger/decker) config file that will run your new plugin.
