# Shed

Protect containers under the roof.

## Overview

_Shed_ is a wrapper around the Docker client. This means that most
commands just call the corresponding Docker command, but for all related
containers. Additionally, there are some new commands.
_Shed_ is written in _Bash_ and it works reading some configurations files that
are also _Bash_ scripts, declaring parameters with string, list or dictionary values.

For easy management, the _Shed_ commands are divided in several separated
scripts. Each script has a reference document:

* [`reference-hub.md`](docs/reference-hub.md): documentation for [`shed-hub`](shed-hub) commands.

* [`reference-image.md`](docs/reference-image.md): documentation for [`shed-image`](shed-image) commands.

* [`reference-container.md`](docs/reference-container.md): documentation for [`shed-container`](shed-container) commands.

* [`reference-network.md`](docs/reference-network.md): documentation for [`shed-network`](shed-network) commands.

* [`reference-volume.md`](docs/reference-volume.md): documentation for [`shed-volume`](shed-volume) commands.

## Shedfiles

For every project managed with _Shed_ you must write two configuration files,
one for the whole project named `Shedfile` and one for each container named like
the container and with the _shed_ extension, for example `container.shed`.

Also, if you want to configure the implicit call to `docker build` made by `shed-hub`,
you  can define a file called `Dockerfile.shed` for each image to build.

These files are _Bash_ files, and all the power of _Bash_ is available. The files
define parameters, with string, list o dictionary values. Important: parameters
not used must not be set, even to the empty string!

### Project shedfile

This is a project Shedfile example:

    # prefixed to image names if defined
    PROJECT=	# null project

    # images to pull
    IMAGES=(
        'busybox:latest'
    )

    # images to build
    BUILDS=(
        '.'
    )

    # containers to create (order is significant)
    CONTAINERS=(
        'echo'
        'receiver'
    )

### Container shedfile

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

All the parameters in the container Shedfile are forwarded to the `docker create` command,
and the names are the same (but adapted to the _Bash_ syntax). The file
[docs/container.shed](docs/container.shed) contains all available parameters
with default values if defined.

### Dockerfile shedfile

This is a dockerfile Shedfile example:

    # Names and values of a buildarg(s)
    BUILD_ARG=( 'user=admin' )

    # Always remove intermediate containers
    FORCE_RM='true'

    # Suppress the build output and print image ID on success
    QUIET='true'

    # Additional tags
    TAG=(
        'mary/docker-whale:1.3'
        'private.com/docker-whale:1.3'
    )

All the parameters in the dockerfile Shedfile are forwarded to the `docker build` command,
and the names are the same (but adapted to the _Bash_ syntax). The file
[docs/dockerfile.shed](docs/dockerfile.shed) contains all available parameters
with default values if defined.

## Names for images and containers

_Shed_ will choose names for images and containers using the following algorithms.

### Images

The full syntax for the string defining images in the project Shedfile
parameter `BUILDS` is 

    [REGISTRYHOST/][USERNAME/]NAME[#ALT][:TAG]

This is an extension to the Docker tag syntax, with the added `[#ALT]` used to
define an alternative Dockerfile filename.

Image name algorithm:

1. If an alternative Dockerfile has been provided, this filename is choosen as
   the image name (without extension);  if not, the basename of the image path
   will be the image name.

3. If the `PROJECT` parameter is defined and is not equal to the image name,
   this is prefixed with the `PROJECT` value and an underscore.

### Image tags

Tagging algorithm:


1. All built images will be tagged with the `latest` tag.

2. If a tag is provided in the string that defines the image, a second tag will be added.

3. Additional tags can be defined in the `TAG` parameter in the dockerfile Shedfile.

### Containers

Container name algorithm:

1. The names used in the `CONTAINERS` project Shedfile parameter are converted
   to lowercase. The corresponding `.shed` file must exist.

2. If the `PROJECT` parameter is defined and is not equal to the container name,
   this is prefixed with the `PROJECT` value and an underscore.

## Configuration

_Shed_ will try to load several configuration files, in this order:

- `/usr/local/etc/shed.conf`
- `$HOME/.shed`
- `.shed`

At this moment the only parameter you can define is
`TAGS_PREFIX`, used to set default prefix for image names (without the ending `/`):

    [REGISTRYHOST/][USERNAME/]NAME[#ALT][:TAG]
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
