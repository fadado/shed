# Journal

This example implements a container using the journald logging driver.

1. Create container:

        shed-hub build      # 'shed-hub build --remove' to start again

2. Run container and follow logs:

        shed-container start journal
        journalctl -f CONTAINER_NAME=journal
