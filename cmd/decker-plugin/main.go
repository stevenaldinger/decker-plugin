package main

import (
	"fmt"
	"os"
	"os/exec"
)

type plugin string

// --- wants input: ---
// inputs_map{
//   "host": "example.com",
//   "plugin_enabled": "true",
// }
//
// --- gives output: ---
// results_map{
//  "raw_output": "...",
// }
func (p plugin) Run(inputs_map, results_map *map[string]string) {
	var (
		cmdOut []byte
		err    error
	)

	target_host := (*inputs_map)["host"]
	plugin_enabled := (*inputs_map)["plugin_enabled"]

	cmdName := "echo"
	cmdArgs := []string{"Hello World!", "\nhost:", target_host, "\nplugin_enabled:", plugin_enabled}

	if cmdOut, err = exec.Command(cmdName, cmdArgs...).Output(); err != nil {
		fmt.Fprintln(os.Stderr, "There was an error running decker-plugin: ", err)
		return
	}

	output := string(cmdOut)

	(*results_map)["raw_output"] = output
}

var Plugin plugin
