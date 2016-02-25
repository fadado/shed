# shed-network

    Usage:	shed-network [OPTIONS] COMMAND [OPTIONS]
    
    Commands:
      create                   Create a network
      connect                  Connect container to a network
      disconnect               Disconnect container from a network
      inspect                  Display detailed network information
      ls                       List all networks
      rm                       Remove a network
    
    Run 'shed-network COMMAND --help' for more information on a command.
    
      --help             Print usage

# Commands

## connect

    Usage:	shed-network connect [OPTIONS] NETWORK CONTAINER
    
    Connects a container to a network
    
      --alias=[]         Add network-scoped alias for the container
      --help             Print usage
      --ip               IP Address
      --ip6              IPv6 Address
      --link=[]          Add link to another container

## create

    Usage:	shed-network create [OPTIONS] NETWORK-NAME
    
    Creates a new network with a name specified by the user
    
      --aux-address=map[]      auxiliary ipv4 or ipv6 addresses used by Network driver
      -d, --driver=bridge      Driver to manage the Network
      --gateway=[]             ipv4 or ipv6 Gateway for the master subnet
      --help                   Print usage
      --internal               restricts external access to the network
      --ip-range=[]            allocate container ip from a sub-range
      --ipam-driver=default    IP Address Management Driver
      --ipam-opt=map[]         set IPAM driver specific options
      -o, --opt=map[]          set driver specific options
      --subnet=[]              subnet in CIDR format that represents a network segment

## disconnect

    Usage:	shed-network disconnect [OPTIONS] NETWORK CONTAINER
    
    Disconnects container from a network
    
      -f, --force        Force the container to disconnect from a network
      --help             Print usage

## inspect

    Usage:	shed-network inspect [OPTIONS] NETWORK [NETWORK...]
    
    Displays detailed information on one or more networks
    
      -f, --format       Format the output using the given go template
      --help             Print usage

## ls

    Usage:	shed-network ls [OPTIONS]
    
    Lists networks
    
      -f, --filter=[]    Filter output based on conditions provided
      --help             Print usage
      --no-trunc         Do not truncate the output
      -q, --quiet        Only display numeric IDs

## rm

    Usage:	shed-network rm [OPTIONS] NETWORK [NETWORK...]
    
    Deletes one or more networks
    
      --help             Print usage

