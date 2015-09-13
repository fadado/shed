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

## Installation

Simply put the scripts in your `PATH`, o run `make install` in the scripts
source directory (just in case, read before the `Makefile`).

## Documentation and tests

The directories [docs](./docs) and [tests](./tests) contains several files you
should read and exercise.

<!--
vim:syntax=markdown:et:ts=4:sw=4:ai
-->
