This example show how to run a _Bash_ script inside the container with PID 1 and
a supervised worker service as a background job.

How to test:

1. Create the container:

        rm build.log
        make

2. Test:

        shed-container ship supervised
