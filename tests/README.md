# Tests

Example tests grouped in this directory:

1. [**hello**](./hello): implements the classical "Hello, world!" test.

1. [**create**](./create): implements the classical "Hello, world!" test with all possible
   parameters defined in the `hello.shed` file.

1. [**journal**](./journal): implements a container using the journald logging driver.

1. [**ECHO**](./ECHO): implements the ECHO protocol server using two linked containers.

1. [**propagate**](./propagate): shows how to create multiple linked containers.

1. [**postgres**](./postgres): implements five layered images and three independent
   containers running the PostgreSQL database.

1. [**supervised**](./supervised): shows how to run a _Bash_ script inside the container with PID 1 and
a supervised worker service as a background job.

<!--
vim:syntax=markdown:et:ts=4:sw=4:ai
-->