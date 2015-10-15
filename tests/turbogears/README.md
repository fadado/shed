# Turbo Gears

This example runs a Python application with Turbo Gears.

1. Create images and containers:

        shed-hub build --remove

2. Run application:

        shed-container ship

   Long format:

        shed-container --propagate ship turbogears

3. Visit page (use any HTTP user agent):

        curl http://localhost:8080/
        wget -q -O - http://localhost:8080/
        lynx http://localhost:8080/
        elinks http://localhost:8080/
