# shed-container

    Usage: shed-container [-h | --help | -V]
           shed-container [OPTIONS] COMMAND [ARGS]
    
    Options:
        -a, --all       Apply command to all containers
        -h, --help      Help information
        -l, --latest    Apply command to the latest created container
        -p, --propagate Propagate command to linked containers
        -V              Show version information
    
    General commands:
        build [OPTIONS] FILE
            Build a container from a Shedfile
        cp [OPTIONS] CONTAINER:PATH LOCALPATH | -
           [OPTIONS] LOCALPATH | - CONTAINER:PATH
           Copy files/folders between a container and the host
        create [OPTIONS] IMAGE [COMMAND] [ARG...]
            WARNING: replaced by 'build'
        diff [OPTIONS] CONTAINER
            Inspect changes on a container's filesystem
        export [OPTIONS] CONTAINER
            Export the contents of a filesystem as a tar archive to STDOUT
        links [OPTIONS] CONTAINER
            Show direct links of a container
        port [OPTIONS] CONTAINER [PRIVATE_PORT[/PROTO]]
            Lookup the public-facing port that is NAT-ed to PRIVATE_PORT
        ps [OPTIONS]
            List containers
        rename [OPTIONS] OLD_NAME NEW_NAME
            Rename a container
        rm [OPTIONS] CONTAINER [CONTAINER...]
            Remove one or more containers
        status CONTAINER
            Show container status
    
    Runtime commands:
        attach [OPTIONS] CONTAINER
            Attach to a running container
        exec [OPTIONS] [CONTAINER COMMAND [ARG...]]
            Run a command in a running container
        kill [OPTIONS] CONTAINER [CONTAINER...]
            Kill a running container
        logs [OPTIONS] CONTAINER
            Fetch the logs of a container
        pause [OPTIONS] CONTAINER [CONTAINER...]
            Pause all processes within a container
        restart [OPTIONS] CONTAINER [CONTAINER...]
            Restart a running container
        run [OPTIONS] IMAGE [COMMAND] [ARG...]
            WARNING: recommended 'start' after 'build'
        ship [OPTIONS]
            Start and attach to containers
        start [OPTIONS] CONTAINER [CONTAINER...]
            Start a stopped container
        stats [OPTIONS] CONTAINER [CONTAINER...]
            Display a live stream of one or more containers' resource usage statistics
        stop [OPTIONS] CONTAINER [CONTAINER...]
            Stop a running container
        top CONTAINER [ps OPTIONS]
            Lookup the running processes of a container
        unpause CONTAINER [CONTAINER...]
            Unpause a paused container
        update [OPTIONS] CONTAINER [CONTAINER...]
            Update resources of one or more containers
        wait [OPTIONS] CONTAINER [CONTAINER...]
            Block until a container stops, then print its exit code
    
    Run 'shed-container COMMAND --help' for more information on a command.

# General commands

## build

    Usage: shed-container build [OPTIONS] FILE
    
    Build a new container from the Shedfile FILE
    
      --name=""             Assign a name to the container
      -r, --remove=false    Remove container, stopping if necessary

## cp

    Usage:	shed-container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	shed-container cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
    
    Copy files/folders between a container and the local filesystem
    Use '-' as the source to read a tar archive from stdin
    and extract it to a directory destination in a container.
    Use '-' as the destination to stream a tar archive of a
    container source to stdout.
    
      --help               Print usage
      -L, --follow-link    Always follow symbol link in SRC_PATH
    

## create

    Usage:	shed-container create [OPTIONS] IMAGE [COMMAND] [ARG...]
    
    Create a new container
    
      -a, --attach=[]                 Attach to STDIN, STDOUT or STDERR
      --add-host=[]                   Add a custom host-to-IP mapping (host:ip)
      --blkio-weight                  Block IO (relative weight), between 10 and 1000
      --blkio-weight-device=[]        Block IO weight (relative device weight)
      --cpu-shares                    CPU shares (relative weight)
      --cap-add=[]                    Add Linux capabilities
      --cap-drop=[]                   Drop Linux capabilities
      --cgroup-parent                 Optional parent cgroup for the container
      --cidfile                       Write the container ID to the file
      --cpu-period                    Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota                     Limit CPU CFS (Completely Fair Scheduler) quota
      --cpuset-cpus                   CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems                   MEMs in which to allow execution (0-3, 0,1)
      --device=[]                     Add a host device to the container
      --device-read-bps=[]            Limit read rate (bytes per second) from a device
      --device-read-iops=[]           Limit read rate (IO per second) from a device
      --device-write-bps=[]           Limit write rate (bytes per second) to a device
      --device-write-iops=[]          Limit write rate (IO per second) to a device
      --disable-content-trust=true    Skip image verification
      --dns=[]                        Set custom DNS servers
      --dns-opt=[]                    Set DNS options
      --dns-search=[]                 Set custom DNS search domains
      -e, --env=[]                    Set environment variables
      --entrypoint                    Overwrite the default ENTRYPOINT of the image
      --env-file=[]                   Read in a file of environment variables
      --expose=[]                     Expose a port or a range of ports
      --group-add=[]                  Add additional groups to join
      -h, --hostname                  Container host name
      --help                          Print usage
      -i, --interactive               Keep STDIN open even if not attached
      --ip                            Container IPv4 address (e.g. 172.30.100.104)
      --ip6                           Container IPv6 address (e.g. 2001:db8::33)
      --ipc                           IPC namespace to use
      --isolation                     Container isolation level
      --kernel-memory                 Kernel memory limit
      -l, --label=[]                  Set meta data on a container
      --label-file=[]                 Read in a line delimited file of labels
      --link=[]                       Add link to another container
      --log-driver                    Logging driver for container
      --log-opt=[]                    Log driver options
      -m, --memory                    Memory limit
      --mac-address                   Container MAC address (e.g. 92:d0:c6:0a:29:33)
      --memory-reservation            Memory soft limit
      --memory-swap                   Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --memory-swappiness=-1          Tune container memory swappiness (0 to 100)
      --name                          Assign a name to the container
      --net=default                   Connect a container to a network
      --net-alias=[]                  Add network-scoped alias for the container
      --oom-kill-disable              Disable OOM Killer
      --oom-score-adj                 Tune host's OOM preferences (-1000 to 1000)
      -P, --publish-all               Publish all exposed ports to random ports
      -p, --publish=[]                Publish a container's port(s) to the host
      --pid                           PID namespace to use
      --privileged                    Give extended privileges to this container
      --read-only                     Mount the container's root filesystem as read only
      --restart=no                    Restart policy to apply when a container exits
      --security-opt=[]               Security Options
      --shm-size                      Size of /dev/shm, default value is 64MB
      --stop-signal=SIGTERM           Signal to stop a container, SIGTERM by default
      -t, --tty                       Allocate a pseudo-TTY
      --tmpfs=[]                      Mount a tmpfs directory
      -u, --user                      Username or UID (format: <name|uid>[:<group|gid>])
      --ulimit=[]                     Ulimit options
      --uts                           UTS namespace to use
      -v, --volume=[]                 Bind mount a volume
      --volume-driver                 Optional volume driver for the container
      --volumes-from=[]               Mount volumes from the specified container(s)
      -w, --workdir                   Working directory inside the container
    

## diff

    Usage:	shed-container diff [OPTIONS] CONTAINER
    
    Inspect changes on a container's filesystem
    
      --help             Print usage
    
    Extended usage:
    
      shed-container --latest diff
    

## export

    Usage:	shed-container export [OPTIONS] CONTAINER
    
    Export a container's filesystem as a tar archive
    
      --help             Print usage
      -o, --output       Write to a file, instead of STDOUT
    
    Extended usage:
    
      shed-container --latest export
    

## links

    Usage: shed-container links [OPTIONS] CONTAINER
    
    Show links from CONTAINER in pre-order (root first) or post-order (root last)
    
        -p, --post=false    Show links in post-order

## port

    Usage:	shed-container port [OPTIONS] CONTAINER [PRIVATE_PORT[/PROTO]]
    
    List port mappings or a specific mapping for the CONTAINER
    
      --help             Print usage
    
    Extended usage:
    
      shed-container --latest port [PRIVATE_PORT[/PROTO]]
    

## ps

    Usage:	shed-container ps [OPTIONS]
    
    List containers
    
      -a, --all          Show all containers (default shows just running)
      -f, --filter=[]    Filter output based on conditions provided
      --format           Pretty-print containers using a Go template
      --help             Print usage
      -l, --latest       Show the latest created container (includes all states)
      -n=-1              Show n last created containers (includes all states)
      --no-trunc         Don't truncate output
      -q, --quiet        Only display numeric IDs
      -s, --size         Display total file sizes
    

## rename

    Usage:	shed-container rename [OPTIONS] OLD_NAME NEW_NAME
    
    Rename a container
    
      --help             Print usage
    

## rm

    Usage:	shed-container rm [OPTIONS] CONTAINER [CONTAINER...]
    
    Remove one or more containers
    
      -f, --force        Force the removal of a running container (uses SIGKILL)
      --help             Print usage
      -l, --link         Remove the specified link
      -v, --volumes      Remove the volumes associated with the container
    
    Extended usage:
    
      shed-container --all rm [OPTIONS]
      shed-container --propagate rm [OPTIONS] CONTAINER
      shed-container --latest --propagate rm [OPTIONS]
      shed-container --latest rm [OPTIONS] [CONTAINER...]
    

## status

    Usage: shed-container status CONTAINER
    
    Show CONTAINER status

# Runtime commands

## attach

    Usage:	shed-container attach [OPTIONS] CONTAINER
    
    Attach to a running container
    
      --detach-keys       Override the key sequence for detaching a container
      --help              Print usage
      --no-stdin          Do not attach STDIN
      --sig-proxy=true    Proxy all received signals to the process
    
    Extended usage:
    
      shed-container --latest attach [OPTIONS]
    

## exec

    Usage:	shed-container exec [OPTIONS] CONTAINER COMMAND [ARG...]
    
    Run a command in a running container
    
      -d, --detach         Detached mode: run command in the background
      --detach-keys        Override the key sequence for detaching a container
      --help               Print usage
      -i, --interactive    Keep STDIN open even if not attached
      --privileged         Give extended privileges to the command
      -t, --tty            Allocate a pseudo-TTY
      -u, --user           Username or UID (format: <name|uid>[:<group|gid>])
    

## kill

    Usage:	shed-container kill [OPTIONS] CONTAINER [CONTAINER...]
    
    Kill a running container
    
      --help               Print usage
      -s, --signal=KILL    Signal to send to the container
    
    Extended usage:
    
      shed-container kill
      shed-container kill [OPTIONS]
      shed-container --all kill [OPTIONS]
      shed-container --propagate kill [OPTIONS] CONTAINER
      shed-container --latest --propagate kill [OPTIONS]
      shed-container --latest kill [OPTIONS] [CONTAINER...]
    

## logs

    Usage:	shed-container logs [OPTIONS] CONTAINER
    
    Fetch the logs of a container
    
      -f, --follow        Follow log output
      --help              Print usage
      --since             Show logs since timestamp
      -t, --timestamps    Show timestamps
      --tail=all          Number of lines to show from the end of the logs
    
    Extended usage:
    
      shed-container logs
      shed-container --latest logs [OPTIONS]
    

## pause

    Usage:	shed-container pause [OPTIONS] CONTAINER [CONTAINER...]
    
    Pause all processes within a container
    
      --help             Print usage
    
    Extended usage:
    
      shed-container pause
      shed-container --all pause
      shed-container --propagate pause CONTAINER
      shed-container --latest --propagate pause
      shed-container --latest pause [CONTAINER...]
    

## restart

    Usage:	shed-container restart [OPTIONS] CONTAINER [CONTAINER...]
    
    Restart a container
    
      --help             Print usage
      -t, --time=10      Seconds to wait for stop before killing the container
    
    Extended usage:
    
      shed-container restart
      shed-container restart [OPTIONS]
      shed-container --all restart [OPTIONS]
      shed-container --propagate restart [OPTIONS] CONTAINER
      shed-container --latest --propagate restart [OPTIONS]
      shed-container --latest restart [OPTIONS] [CONTAINER...]
    

## run

    Usage:	shed-container run [OPTIONS] IMAGE [COMMAND] [ARG...]
    
    Run a command in a new container
    
      -a, --attach=[]                 Attach to STDIN, STDOUT or STDERR
      --add-host=[]                   Add a custom host-to-IP mapping (host:ip)
      --blkio-weight                  Block IO (relative weight), between 10 and 1000
      --blkio-weight-device=[]        Block IO weight (relative device weight)
      --cpu-shares                    CPU shares (relative weight)
      --cap-add=[]                    Add Linux capabilities
      --cap-drop=[]                   Drop Linux capabilities
      --cgroup-parent                 Optional parent cgroup for the container
      --cidfile                       Write the container ID to the file
      --cpu-period                    Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota                     Limit CPU CFS (Completely Fair Scheduler) quota
      --cpuset-cpus                   CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems                   MEMs in which to allow execution (0-3, 0,1)
      -d, --detach                    Run container in background and print container ID
      --detach-keys                   Override the key sequence for detaching a container
      --device=[]                     Add a host device to the container
      --device-read-bps=[]            Limit read rate (bytes per second) from a device
      --device-read-iops=[]           Limit read rate (IO per second) from a device
      --device-write-bps=[]           Limit write rate (bytes per second) to a device
      --device-write-iops=[]          Limit write rate (IO per second) to a device
      --disable-content-trust=true    Skip image verification
      --dns=[]                        Set custom DNS servers
      --dns-opt=[]                    Set DNS options
      --dns-search=[]                 Set custom DNS search domains
      -e, --env=[]                    Set environment variables
      --entrypoint                    Overwrite the default ENTRYPOINT of the image
      --env-file=[]                   Read in a file of environment variables
      --expose=[]                     Expose a port or a range of ports
      --group-add=[]                  Add additional groups to join
      -h, --hostname                  Container host name
      --help                          Print usage
      -i, --interactive               Keep STDIN open even if not attached
      --ip                            Container IPv4 address (e.g. 172.30.100.104)
      --ip6                           Container IPv6 address (e.g. 2001:db8::33)
      --ipc                           IPC namespace to use
      --isolation                     Container isolation level
      --kernel-memory                 Kernel memory limit
      -l, --label=[]                  Set meta data on a container
      --label-file=[]                 Read in a line delimited file of labels
      --link=[]                       Add link to another container
      --log-driver                    Logging driver for container
      --log-opt=[]                    Log driver options
      -m, --memory                    Memory limit
      --mac-address                   Container MAC address (e.g. 92:d0:c6:0a:29:33)
      --memory-reservation            Memory soft limit
      --memory-swap                   Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --memory-swappiness=-1          Tune container memory swappiness (0 to 100)
      --name                          Assign a name to the container
      --net=default                   Connect a container to a network
      --net-alias=[]                  Add network-scoped alias for the container
      --oom-kill-disable              Disable OOM Killer
      --oom-score-adj                 Tune host's OOM preferences (-1000 to 1000)
      -P, --publish-all               Publish all exposed ports to random ports
      -p, --publish=[]                Publish a container's port(s) to the host
      --pid                           PID namespace to use
      --privileged                    Give extended privileges to this container
      --read-only                     Mount the container's root filesystem as read only
      --restart=no                    Restart policy to apply when a container exits
      --rm                            Automatically remove the container when it exits
      --security-opt=[]               Security Options
      --shm-size                      Size of /dev/shm, default value is 64MB
      --sig-proxy=true                Proxy received signals to the process
      --stop-signal=SIGTERM           Signal to stop a container, SIGTERM by default
      -t, --tty                       Allocate a pseudo-TTY
      --tmpfs=[]                      Mount a tmpfs directory
      -u, --user                      Username or UID (format: <name|uid>[:<group|gid>])
      --ulimit=[]                     Ulimit options
      --uts                           UTS namespace to use
      -v, --volume=[]                 Bind mount a volume
      --volume-driver                 Optional volume driver for the container
      --volumes-from=[]               Mount volumes from the specified container(s)
      -w, --workdir                   Working directory inside the container
    

## ship

    Usage: shed-container ship [OPTIONS]
    
    Start and attach to containers
    
        -f, --follow=false    Follow running containers logs
        --no-color=false      Produce monochrome output

## start

    Usage:	shed-container start [OPTIONS] CONTAINER [CONTAINER...]
    
    Start one or more stopped containers
    
      -a, --attach         Attach STDOUT/STDERR and forward signals
      --detach-keys        Override the key sequence for detaching a container
      --help               Print usage
      -i, --interactive    Attach container's STDIN
    
    Extended usage:
    
      shed-container start
      shed-container --all start [OPTIONS]
      shed-container --propagate start [OPTIONS] CONTAINER
      shed-container --latest --propagate start [OPTIONS]
      shed-container --latest start [OPTIONS] [CONTAINER...]
    

## stats

    Usage:	shed-container stats [OPTIONS] [CONTAINER...]
    
    Display a live stream of container(s) resource usage statistics
    
      -a, --all          Show all containers (default shows just running)
      --help             Print usage
      --no-stream        Disable streaming stats and only pull the first result
    

## stop

    Usage:	shed-container stop [OPTIONS] CONTAINER [CONTAINER...]
    
    Stop a running container.
    Sending SIGTERM and then SIGKILL after a grace period
    
      --help             Print usage
      -t, --time=10      Seconds to wait for stop before killing it
    
    Extended usage:
    
      shed-container stop
      shed-container stop [OPTIONS]
      shed-container --all stop [OPTIONS]
      shed-container --propagate stop [OPTIONS] CONTAINER
      shed-container --latest --propagate stop [OPTIONS]
      shed-container --latest stop [OPTIONS] [CONTAINER...]
    

## top

    Usage:	shed-container top [OPTIONS] CONTAINER [ps OPTIONS]
    
    Display the running processes of a container
    
      --help             Print usage
    
    Extended usage:
    
      shed-container --latest top [ps OPTIONS]
    

## update

    Usage:	shed-container update [OPTIONS] CONTAINER [CONTAINER...]
    
    Update resources of one or more containers
    
      --blkio-weight          Block IO (relative weight), between 10 and 1000
      --cpu-shares            CPU shares (relative weight)
      --cpu-period            Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota             Limit CPU CFS (Completely Fair Scheduler) quota
      --cpuset-cpus           CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems           MEMs in which to allow execution (0-3, 0,1)
      --help                  Print usage
      --kernel-memory         Kernel memory limit
      -m, --memory            Memory limit
      --memory-reservation    Memory soft limit
      --memory-swap           Swap limit equal to memory plus swap: '-1' to enable unlimited swap
    
    Extended usage:
    
      shed-container update
      shed-container update [OPTIONS]
      shed-container --all update [OPTIONS]
      shed-container --propagate update [OPTIONS] CONTAINER
      shed-container --latest --propagate update [OPTIONS]
      shed-container --latest update [OPTIONS] [CONTAINER...]
    

## unpause

    Usage:	shed-container unpause [OPTIONS] CONTAINER [CONTAINER...]
    
    Unpause all processes within a container
    
      --help             Print usage
    
    Extended usage:
    
      shed-container unpause
      shed-container --all unpause
      shed-container --propagate unpause CONTAINER
      shed-container --latest --propagate unpause
      shed-container --latest unpause [CONTAINER...]
    

## wait

    Usage:	shed-container wait [OPTIONS] CONTAINER [CONTAINER...]
    
    Block until a container stops, then print its exit code
    
      --help             Print usage
    
    Extended usage:
    
      shed-container --all wait
      shed-container --propagate wait CONTAINER
      shed-container --latest --propagate wait
      shed-container --latest wait [CONTAINER...]
    

