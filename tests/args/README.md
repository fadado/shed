# Args

This example demostrate the BUILD_ARG feature and alternative dockerfile.

1. Create container:

        shed-hub build      # 'shed-hub build --remove' to start again

2. Run container:

        shed-container run -it --rm shed/aa_args 
        shed-container run -it --rm shed/aa_altargs 
