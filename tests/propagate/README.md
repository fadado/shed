# Propagate

This example show how to create multiple linked containers.
Study the images to understand the defined links.

How to test:

1. Create containers:

        shed-hub build      # 'shed-hub build --remove' to start again

2. Test containers:

        shed-container start
        shed-container pause
        shed-container unpause
        shed-container stop --time 1
        shed-container --propagate rm p_f

