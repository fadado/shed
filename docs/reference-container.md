# shed-container

    Usage: shed-container [-h | --help
           shed-container [OPTIONS] <command> [<args>]
    
    Options:
        -a, --all       Apply command to all containers
        -g, --group=""  Apply command to containers in named group
        -h, --help      Help information
        -l, --latest    Apply command to the latest created container
        -p, --propagate Propagate command to linked containers
    
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
        list [OPTIONS]
            List containers
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
        enter CONTAINER [COMMAND [ARG...]]
            Run a command in a running container using nsenter
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
        ship [OPTIONS] CONTAINER
            Start and attach to containers (or follow logs)
        start [OPTIONS] CONTAINER [CONTAINER...]
            Start a stopped container
        stats [OPTIONS] CONTAINER [CONTAINER...]
            Display a live stream of one or more containers' resource usage statistics
        stop [OPTIONS] CONTAINER [CONTAINER...]
            Stop a running container
        top CONTAINER [list OPTIONS]
            Lookup the running processes of a container
        unpause CONTAINER [CONTAINER...]
            Unpause a paused container
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

    Usage:	shed-container cp [OPTIONS] CONTAINER:PATH LOCALPATH|-
    	shed-container cp [OPTIONS] LOCALPATH|- CONTAINER:PATH
    
    Copy files/folders between a container and your host.
    Use '-' as the source to read a tar archive from stdin
    and extract it to a directory destination in a container.
    Use '-' as the destination to stream a tar archive of a
    container source to stdout.
    
      --help=false       Print usage
    
    Extended usage:
    
      shed-container --latest cp PATH HOSTPATH
    

## create

    Usage:	shed-container create [OPTIONS] IMAGE [COMMAND] [ARG...]
    
    Create a new container
    
      -a, --attach=[]                 Attach to STDIN, STDOUT or STDERR
      --add-host=[]                   Add a custom host-to-IP mapping (host:ip)
      --blkio-weight=0                Block IO (relative weight), between 10 and 1000
      -c, --cpu-shares=0              CPU shares (relative weight)
      --cap-add=[]                    Add Linux capabilities
      --cap-drop=[]                   Drop Linux capabilities
      --cgroup-parent=                Optional parent cgroup for the container
      --cidfile=                      Write the container ID to the file
      --cpu-period=0                  Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota=0                   Limit CPU CFS (Completely Fair Scheduler) quota
      --cpuset-cpus=                  CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems=                  MEMs in which to allow execution (0-3, 0,1)
      --device=[]                     Add a host device to the container
      --disable-content-trust=true    Skip image verification
      --dns=[]                        Set custom DNS servers
      --dns-search=[]                 Set custom DNS search domains
      -e, --env=[]                    Set environment variables
      --entrypoint=                   Overwrite the default ENTRYPOINT of the image
      --env-file=[]                   Read in a file of environment variables
      --expose=[]                     Expose a port or a range of ports
      --group-add=[]                  Add additional groups to join
      -h, --hostname=                 Container host name
      --help=false                    Print usage
      -i, --interactive=false         Keep STDIN open even if not attached
      --ipc=                          IPC namespace to use
      -l, --label=[]                  Set meta data on a container
      --label-file=[]                 Read in a line delimited file of labels
      --link=[]                       Add link to another container
      --log-driver=                   Logging driver for container
      --log-opt=[]                    Log driver options
      --lxc-conf=[]                   Add custom lxc options
      -m, --memory=                   Memory limit
      --mac-address=                  Container MAC address (e.g. 92:d0:c6:0a:29:33)
      --memory-swap=                  Total memory (memory + swap), '-1' to disable swap
      --memory-swappiness=-1          Tuning container memory swappiness (0 to 100)
      --name=                         Assign a name to the container
      --net=default                   Set the Network mode for the container
      --oom-kill-disable=false        Disable OOM Killer
      -P, --publish-all=false         Publish all exposed ports to random ports
      -p, --publish=[]                Publish a container's port(s) to the host
      --pid=                          PID namespace to use
      --privileged=false              Give extended privileges to this container
      --read-only=false               Mount the container's root filesystem as read only
      --restart=no                    Restart policy to apply when a container exits
      --security-opt=[]               Security Options
      -t, --tty=false                 Allocate a pseudo-TTY
      -u, --user=                     Username or UID (format: <name|uid>[:<group|gid>])
      --ulimit=[]                     Ulimit options
      --uts=                          UTS namespace to use
      -v, --volume=[]                 Bind mount a volume
      --volume-driver=                Optional volume driver for the container
      --volumes-from=[]               Mount volumes from the specified container(s)
      -w, --workdir=                  Working directory inside the container
    

## diff

    Usage:	shed-container diff [OPTIONS] CONTAINER
    
    Inspect changes on a container's filesystem
    
      --help=false       Print usage
    
    Extended usage:
    
      shed-container --latest diff
    

## export

    Usage:	shed-container export [OPTIONS] CONTAINER
    
    Export the contents of a container's filesystem as a tar archive
    
      --help=false       Print usage
      -o, --output=      Write to a file, instead of STDOUT
    
    Extended usage:
    
      shed-container --latest export
    

## links

    Usage: shed-container links [OPTIONS] CONTAINER
    
    Show links from CONTAINER in pre-order (root first) or post-order (root last)
    
        -p, --post=false    Show links in post-order

## list

    Usage:	shed-container list [OPTIONS]
    
    List containers
    
      -a, --all=false       Show all containers (default shows just running)
      --before=             Show only container created before Id or Name
      -f, --filter=[]       Filter output based on conditions provided
      --format=             Pretty-print containers using a Go template
      --help=false          Print usage
      -l, --latest=false    Show the latest created container, include non-running
      -n=-1                 Show n last created containers, include non-running
      --no-trunc=false      Don't truncate output
      -q, --quiet=false     Only display numeric IDs
      -s, --size=false      Display total file sizes
      --since=              Show created since Id or Name, include non-running
    

## port

    Usage:	shed-container port [OPTIONS] CONTAINER [PRIVATE_PORT[/PROTO]]
    
    List port mappings for the CONTAINER, or lookup the public-facing port that
    is NAT-ed to the PRIVATE_PORT
    
      --help=false       Print usage
    
    Extended usage:
    
      shed-container --latest port [PRIVATE_PORT[/PROTO]]
    

## ps

    Usage:	shed-container ps [OPTIONS]
    
    List containers
    
      -a, --all=false       Show all containers (default shows just running)
      --before=             Show only container created before Id or Name
      -f, --filter=[]       Filter output based on conditions provided
      --format=             Pretty-print containers using a Go template
      --help=false          Print usage
      -l, --latest=false    Show the latest created container, include non-running
      -n=-1                 Show n last created containers, include non-running
      --no-trunc=false      Don't truncate output
      -q, --quiet=false     Only display numeric IDs
      -s, --size=false      Display total file sizes
      --since=              Show created since Id or Name, include non-running
    

## rename

    Usage:	shed-container rename [OPTIONS] OLD_NAME NEW_NAME
    
    Rename a container
    
      --help=false       Print usage
    

## rm

    Usage:	shed-container rm [OPTIONS] CONTAINER [CONTAINER...]
    
    Remove one or more containers
    
      -f, --force=false      Force the removal of a running container (uses SIGKILL)
      --help=false           Print usage
      -l, --link=false       Remove the specified link
      -v, --volumes=false    Remove the volumes associated with the container
    
    Extended usage:
    
      shed-container --all rm [OPTIONS]
      shed-container --group="" rm [OPTIONS]
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
    
      --help=false        Print usage
      --no-stdin=false    Do not attach STDIN
      --sig-proxy=true    Proxy all received signals to the process
    
    Extended usage:
    
      shed-container --latest attach [OPTIONS]
    

## enter

    Usage: shed-container enter CONTAINER [COMMAND [ARG...]]
    
    Run a command in a running container using nsenter

## exec

    Usage:	shed-container exec [OPTIONS] CONTAINER COMMAND [ARG...]
    
    Run a command in a running container
    
      -d, --detach=false         Detached mode: run command in the background
      --help=false               Print usage
      -i, --interactive=false    Keep STDIN open even if not attached
      -t, --tty=false            Allocate a pseudo-TTY
      -u, --user=                Username or UID (format: <name|uid>[:<group|gid>])
    

## kill

    Usage:	shed-container kill [OPTIONS] CONTAINER [CONTAINER...]
    
    Kill a running container using SIGKILL or a specified signal
    
      --help=false         Print usage
      -s, --signal=KILL    Signal to send to the container
    
    Extended usage:
    
      shed-container --all kill [OPTIONS]
      shed-container --group="" kill [OPTIONS]
      shed-container --propagate kill [OPTIONS] CONTAINER
      shed-container --latest --propagate kill [OPTIONS]
      shed-container --latest kill [OPTIONS] [CONTAINER...]
    

## logs

    Usage:	shed-container logs [OPTIONS] CONTAINER
    
    Fetch the logs of a container
    
      -f, --follow=false        Follow log output
      --help=false              Print usage
      --since=                  Show logs since timestamp
      -t, --timestamps=false    Show timestamps
      --tail=all                Number of lines to show from the end of the logs
    
    Extended usage:
    
      shed-container --latest logs [OPTIONS]
    

## pause

    Usage:	shed-container pause [OPTIONS] CONTAINER [CONTAINER...]
    
    Pause all processes within a container
    
      --help=false       Print usage
    
    Extended usage:
    
      shed-container --all pause
      shed-container --group="" pause
      shed-container --propagate pause CONTAINER
      shed-container --latest --propagate pause
      shed-container --latest pause [CONTAINER...]
    

## restart

    Usage:	shed-container restart [OPTIONS] CONTAINER [CONTAINER...]
    
    Restart a running container
    
      --help=false       Print usage
      -t, --time=10      Seconds to wait for stop before killing the container
    
    Extended usage:
    
      shed-container --all restart [OPTIONS]
      shed-container --group="" restart [OPTIONS]
      shed-container --propagate restart [OPTIONS] CONTAINER
      shed-container --latest --propagate restart [OPTIONS]
      shed-container --latest restart [OPTIONS] [CONTAINER...]
    

## run

    Usage:	shed-container run [OPTIONS] IMAGE [COMMAND] [ARG...]
    
    Run a command in a new container
    
      -a, --attach=[]                 Attach to STDIN, STDOUT or STDERR
      --add-host=[]                   Add a custom host-to-IP mapping (host:ip)
      --blkio-weight=0                Block IO (relative weight), between 10 and 1000
      -c, --cpu-shares=0              CPU shares (relative weight)
      --cap-add=[]                    Add Linux capabilities
      --cap-drop=[]                   Drop Linux capabilities
      --cgroup-parent=                Optional parent cgroup for the container
      --cidfile=                      Write the container ID to the file
      --cpu-period=0                  Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota=0                   Limit CPU CFS (Completely Fair Scheduler) quota
      --cpuset-cpus=                  CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems=                  MEMs in which to allow execution (0-3, 0,1)
      -d, --detach=false              Run container in background and print container ID
      --device=[]                     Add a host device to the container
      --disable-content-trust=true    Skip image verification
      --dns=[]                        Set custom DNS servers
      --dns-search=[]                 Set custom DNS search domains
      -e, --env=[]                    Set environment variables
      --entrypoint=                   Overwrite the default ENTRYPOINT of the image
      --env-file=[]                   Read in a file of environment variables
      --expose=[]                     Expose a port or a range of ports
      --group-add=[]                  Add additional groups to join
      -h, --hostname=                 Container host name
      --help=false                    Print usage
      -i, --interactive=false         Keep STDIN open even if not attached
      --ipc=                          IPC namespace to use
      -l, --label=[]                  Set meta data on a container
      --label-file=[]                 Read in a line delimited file of labels
      --link=[]                       Add link to another container
      --log-driver=                   Logging driver for container
      --log-opt=[]                    Log driver options
      --lxc-conf=[]                   Add custom lxc options
      -m, --memory=                   Memory limit
      --mac-address=                  Container MAC address (e.g. 92:d0:c6:0a:29:33)
      --memory-swap=                  Total memory (memory + swap), '-1' to disable swap
      --memory-swappiness=-1          Tuning container memory swappiness (0 to 100)
      --name=                         Assign a name to the container
      --net=default                   Set the Network mode for the container
      --oom-kill-disable=false        Disable OOM Killer
      -P, --publish-all=false         Publish all exposed ports to random ports
      -p, --publish=[]                Publish a container's port(s) to the host
      --pid=                          PID namespace to use
      --privileged=false              Give extended privileges to this container
      --read-only=false               Mount the container's root filesystem as read only
      --restart=no                    Restart policy to apply when a container exits
      --rm=false                      Automatically remove the container when it exits
      --security-opt=[]               Security Options
      --sig-proxy=true                Proxy received signals to the process
      -t, --tty=false                 Allocate a pseudo-TTY
      -u, --user=                     Username or UID (format: <name|uid>[:<group|gid>])
      --ulimit=[]                     Ulimit options
      --uts=                          UTS namespace to use
      -v, --volume=[]                 Bind mount a volume
      --volume-driver=                Optional volume driver for the container
      --volumes-from=[]               Mount volumes from the specified container(s)
      -w, --workdir=                  Working directory inside the container
    

## ship

    Usage: shed-container ship [OPTIONS] CONTAINER
    
    Start and attach to containers (or follow logs)
    
        -f, --follow=false    Follow container logs
        --no-color=false      Produce monochrome output
    
    Extended usage:
    
      shed-container --all ship [OPTIONS]
      shed-container --group="" ship [OPTIONS]
      shed-container --propagate ship [OPTIONS] CONTAINER
      shed-container --latest --propagate ship [OPTIONS]
      shed-container --latest ship [OPTIONS]
    

## start

    Usage:	shed-container start [OPTIONS] CONTAINER [CONTAINER...]
    
    Start one or more stopped containers
    
      -a, --attach=false         Attach STDOUT/STDERR and forward signals
      --help=false               Print usage
      -i, --interactive=false    Attach container's STDIN
    
    Extended usage:
    
      shed-container --all start [OPTIONS]
      shed-container --group="" start [OPTIONS]
      shed-container --propagate start [OPTIONS] CONTAINER
      shed-container --latest --propagate start [OPTIONS]
      shed-container --latest start [OPTIONS] [CONTAINER...]
    

## stats

    Usage:	shed-container stats [OPTIONS] CONTAINER [CONTAINER...]
    
    Display a live stream of one or more containers' resource usage statistics
    
      --help=false         Print usage
      --no-stream=false    Disable streaming stats and only pull the first result
    

## stop

    Usage:	shed-container stop [OPTIONS] CONTAINER [CONTAINER...]
    
    Stop a running container by sending SIGTERM and then SIGKILL after a
    grace period
    
      --help=false       Print usage
      -t, --time=10      Seconds to wait for stop before killing it
    
    Extended usage:
    
      shed-container --all stop [OPTIONS]
      shed-container --group="" stop [OPTIONS]
      shed-container --propagate stop [OPTIONS] CONTAINER
      shed-container --latest --propagate stop [OPTIONS]
      shed-container --latest stop [OPTIONS] [CONTAINER...]
    

## top

    Usage:	shed-container top [OPTIONS] CONTAINER [ps OPTIONS]
    
    Display the running processes of a container
    
      --help=false       Print usage
    
    Extended usage:
    
      shed-container --latest top [list OPTIONS]
    

## unpause

    Usage:	shed-container unpause [OPTIONS] CONTAINER [CONTAINER...]
    
    Unpause all processes within a container
    
      --help=false       Print usage
    
    Extended usage:
    
      shed-container --all unpause
      shed-container --group="" unpause
      shed-container --propagate unpause CONTAINER
      shed-container --latest --propagate unpause
      shed-container --latest unpause [CONTAINER...]
    

## wait

    Usage:	shed-container wait [OPTIONS] CONTAINER [CONTAINER...]
    
    Block until a container stops, then print its exit code.
    
      --help=false       Print usage
    
    Extended usage:
    
      shed-container --all wait
      shed-container --group="" wait
      shed-container --propagate wait CONTAINER
      shed-container --latest --propagate wait
      shed-container --latest wait [CONTAINER...]
    

