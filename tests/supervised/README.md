# Supervised

This example show how to run a _Bash_ script inside the container with PID 1 and
a supervised worker service as a background job.

**Warning**: require the C library statically linked.
Install with this command (or equivalent):

    sudo yum install glibc-static

How to test:

1. Create the container:

        make build

2. Test:

        shed-container ship supervised
