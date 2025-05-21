# ascmhl-docker
This is a docker image used to run mhl and ascmhl commands.

## Container
Launching the container
``` sh
docker run -it -v $(pwd):$(pwd) -w $(pwd) x43romp/ascmhl

podman run -it -v $(pwd):$(pwd) -w $(pwd) x43romp/ascmhl
```

Starts a container mounting and using your current directory

## tools
there are three tools included in this container

### mhl
``` sh
mhl

Usage: 

1. mhl [--version] <command> [<args>]
The available commands are:
   seal - Seal folders and files
   verify - Verify folders and MHL files

2. See 'mhl help <command>|<topic>' for more information on a specific
   command or a help topic.
The available help topics are:
   mhl_files - Format, naming and location of MHL files
   exit_codes - List of exit codes for all commands

```
more `mhl` documentation at [pomfort/mhl-tool](https://github.com/pomfort/mhl-tool)


### ascmhl
``` sh
ascmhl

Usage: ascmhl [OPTIONS] COMMAND [ARGS]...

Options:
  --version  Show the version and exit.
  --help     Show this message and exit.

Commands:
  create   Create a new generation for a folder or file(s)
  diff     Diff an entire folder structure
  flatten  Flatten an MHL history into one external manifest
  info     Prints information from the ASC MHL history

```
more `ascmhl` documentation at [ascmitc/mhl](https://github.com/ascmitc/mhl)


### ascmhl-debug
``` sh

Usage: ascmhl-debug [OPTIONS] COMMAND [ARGS]...

Options:
  --version  Show the version and exit.
  --help     Show this message and exit.

Commands:
  verify            Verify a folder, single file(s), or a directory hash
  xsd-schema-check  Checks a .mhl file against the xsd schema definition
  hash              Create and print a hash value for a file

```
more `ascmhl-debug` documentation at [ascmitc/mhl](https://github.com/ascmitc/mhl)


### ignore.txt
this is saved to the root directory and can be accessed with `/ignore.txt`

This can be used with `ascmhl create` by adding the argument `-ii /ignore.txt`
``` sh
ascmhl create -v -ii /ignore.txt .
```