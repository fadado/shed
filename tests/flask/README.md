# Flask

This example runs a Python application with Flask and Redis.

1. Create images and containers:

        shed-hub build --remove

2. Run application:

        shed-container ship     # foreground
        shed-container start    # background

   Long format:

        shed-container --propagate ship flask
        shed-container --propagate start flask

3. Visit page (use any HTTP user agent):

        curl http://localhost:5000/
        wget -q -O - http://localhost:5000/
        lynx http://localhost:5000/
        elinks http://localhost:5000/
