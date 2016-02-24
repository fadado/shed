# Shed

Protect containers under the roof.

## Overview

_Shed_ is a wrapper around the Docker client. This means that most
commands just call the corresponding Docker command, but for all related
containers. Additionally, there are some new commands.
_Shed_ is written in _Bash_ and it works reading some configurations files that
are also _Bash_ scripts, declaring parameters with string, list or dictionary values.

For easy management, the _Shed_ commands are classified in three separated
scripts: `shed-hub`, `shed-image` and `shed-container`.  Docker has a lot of
commands: the first exercise you must do to learn Docker is to classify these
commands. In _Shed_ this work has been done in advance for you.

## Shedfiles

For every project managed with _Shed_ you must write two configuration files,
one for the whole project named `Shedfile` and one for each container named like
the container and with the _shed_ extension, for example `container.shed`.

Also, if you want to configure the implicit call to `docker build` made by `shed-hub`,
you  can define a file called `Dockerfile.shed` for each image to build.

These files are _Bash_ files, and all the power of _Bash_ is available. The files
define parameters, with string, list o dictionary values. 

This is a project Shedfile example:

    # prefixed to image names if defined
    PROJECT=	# null project

    # images to pull
    IMAGES=(
        'busybox:latest'
    )

    # images to build, with names in the form [REGISTRYHOST/][USERNAME/]NAME[:TAG]
    # where NAME must be '.' or an immediate subdirectory and the optional prefix
    # defaults to the USERNAME 'shed'. You can define an alternative Dockerfile name 
    # using a NAME with the form name#dockerfile.
    BUILDS=(
        '.'
    )

    # containers to create (order is significant)
    CONTAINERS=(
        'echo'
        'receiver'
    )

This is a container Shedfile example:

    # Base image
    IMAGE='busybox:latest'

    # Set environment variables
    ENVIRON=(
        [PATH]='/bin:/usr/bin'
    )

    # Container host name
    HOSTNAME=$(basename $BASH_SOURCE .shed)

    # Add link to another container in the form of name:alias
    LINK=(
        'echo:echo.domain.com'
    )

    # Keep STDIN open even if not attached
    INTERACTIVE='true'

    # Allocate a pseudo-TTY
    TTY='true'

This is a dockerfile Shedfile example:

    # Names and values of a buildarg(s)
    BUILD_ARG=( 'user=admin' )

    # Always remove intermediate containers
    FORCE_RM='true'

    # Do not use cache when building the image
    NO_CACHE='true'

    # Always  attempt to pull a newer version of the image
    PULL='true'

    # Always  attempt to pull a newer version of the image
    QUIET='true'

All the parameters in the container Shedfile are forwarded to the `docker create` command,
and the names are the same (but adapted to the _Bash_ syntax). The file
[docs/container.shed](docs/container.shed) contains all available parameters
with default values if defined.

All the parameters in the dockerfile Shedfile are forwarded to the `docker build` command,
and the names are the same (but adapted to the _Bash_ syntax). The file
[docs/dockerfile.shed](docs/dockerfile.shed) contains all available parameters
with default values if defined.

## Configuration

_Shed_ will try to load several configuration files, in this order:

- `/usr/local/etc/shed.conf`
- `$HOME/.shed`
- `.shed`

At this moment the only parameter you can define is
`TAGS_PREFIX`, used to set default prefix for image names (without the ending `/`):

    [REGISTRYHOST/][USERNAME/]NAME[:TAG]
    ^^^^^^^^^^^^^^^^^^^^^^^^^^

The default value for `TAGS_PREFIX` is `shed`.

## Installation

Simply put the scripts in your `PATH`, or run `make install` in the scripts
source directory (just in case, read before the `Makefile`).

## Documentation and tests

The directories [docs](./docs) and [tests](./tests) contains several files you
can read and test.

<!--
vim:syntax=markdown:et:ts=4:sw=4:ai
-->
