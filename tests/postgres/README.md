# Postgres

This example implements five layered images and three independent containers
running the PostgreSQL database.

The images are build on top of the other in this order: 
_base_ &rArr; _common_ &rArr; _server_ &rArr; _database_ &rArr; _training_.

The containers run three different database implementations:

1. Plain clean database ([`database.shed`](database.shed)).

1. Database with data inserted at image build time ([`training-build.shed`](training-build.shed)).

1. Database with data inserted at container start time ([`training-start.shed`](training-start.shed)).

How to test:

1. Create images and containers:

        shed-hub build      # 'shed-hub build --remove' to start again

2. Test **postgres_database** container. First start database:

        shed-container start postgres_database

    And then connect with password from `pwfile.txt` file:

        psql -h 127.0.0.1 -U postgres

    or without password

        shed-container exec -it postgres_database psql

    or

        shed-container exec -it postgres_database sh
        sh-4.2$ psql    # inside the container

3. Test **postgres_training-build** container.

        shed-container start postgres_training-build
        psql -h 127.0.0.2 -U postgres
        # etc.

4. Test **postgres_training-start** container.

        shed-container start postgres_training-start
        shed-container logs postgres_training-start
        psql -h 127.0.0.3 -U postgres
        # etc.

5. Verify all three databases are running simultaneously:

        shed-container ps
        shed-container list
