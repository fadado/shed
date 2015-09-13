This example show how to create multiple limked containers.
Study the images to understand the defined links.

How to test:

1. Create containers:

        shed-hub build

2. Test containers:

        shed-container list --all
        shed-container --propagate start p_f
        shed-container list --all
        shed-container --propagate pause p_f
        shed-container --propagate unpause p_f
        shed-container --propagate stop p_f
        shed-container --propagate rm p_f

