This example implements a container using the journald logging driver.

1. Create container:

        shed-hub build

2. Run container and follow logs:

        shed-container start journal
	journalctl -f CONTAINER_NAME=journal
