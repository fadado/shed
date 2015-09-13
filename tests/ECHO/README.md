This example implements the ECHO protocol server using two linked containers:
**echo** and **receiver**.

How to test:

1. Create containers and attach to **receiver** container:

        shed-hub build
        shed-container --propagate start receiver
        shed-container attach receiver

2. Inside the container ask something to **echo** at port 7:

        / # echo $RANDOM | nc echo 7
        26381
        / # echo $RANDOM | nc echo 7
        22049
