# Alpine htop

This example implements the order `htop` under the Alpine distribution.

1. Create container:

        shed-hub build      # 'shed-hub build --remove' to start again

2. Run container:

        shed-container run -it --rm --pid=host shed/htop 
