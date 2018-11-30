// resources refer to plugins
// resources need unique names for use in dependency graph
// their outputs will be available to others using the form resource_name.*
//   ex: nslookup_1.ip

resource "decker-plugin" "decker-plugin" {
  host = "example.com"
  plugin_enabled = "true"
}
