# shed-image

    Usage: shed-image [-h | --help | -V]
           shed-image COMMAND [ARGS]
    
    Options:
        -h, --help  Help information
        -V          Show version information
    
    Commands:
        build [OPTIONS] PATH | URL | -
            Build an image from a Dockerfile
        commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
            Create a new image from a container's changes
        history [OPTIONS] IMAGE
            Show the history of an image
        images [OPTIONS] [REPOSITORY[:TAG]]
            List images
        import [OPTIONS] file | URL | - [REPOSITORY[:TAG]]
            Import the contents from a tarball to create a filesystem image
        load [OPTIONS]
            Load an image from a tar archive or STDIN
        purge [OPTIONS]
            Remove dangling images
        rm [OPTIONS] IMAGE [IMAGE...]
            Remove one or more images
        save [OPTIONS] IMAGE [IMAGE...]
            Save an image(s) to a tar archive
        tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]
            Tag an image into a repository
    
    Run 'shed-image COMMAND --help' for more information on a command.

# Commands

## build

    Usage:	shed-image build [OPTIONS] PATH | URL | -
    
    Build an image from a Dockerfile
    
      --build-arg=[]                  Set build-time variables
      --cpu-shares                    CPU shares (relative weight)
      --cgroup-parent                 Optional parent cgroup for the container
      --cpu-period                    Limit the CPU CFS (Completely Fair Scheduler) period
      --cpu-quota                     Limit the CPU CFS (Completely Fair Scheduler) quota
      --cpuset-cpus                   CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems                   MEMs in which to allow execution (0-3, 0,1)
      --disable-content-trust=true    Skip image verification
      -f, --file                      Name of the Dockerfile (Default is 'PATH/Dockerfile')
      --force-rm                      Always remove intermediate containers
      --help                          Print usage
      --isolation                     Container isolation level
      -m, --memory                    Memory limit
      --memory-swap                   Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --no-cache                      Do not use cache when building the image
      --pull                          Always attempt to pull a newer version of the image
      -q, --quiet                     Suppress the build output and print image ID on success
      --rm=true                       Remove intermediate containers after a successful build
      --shm-size                      Size of /dev/shm, default value is 64MB
      -t, --tag=[]                    Name and optionally a tag in the 'name:tag' format
      --ulimit=[]                     Ulimit options

## commit

    Usage:	shed-image commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
    
    Create a new image from a container's changes
    
      -a, --author        Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")
      -c, --change=[]     Apply Dockerfile instruction to the created image
      --help              Print usage
      -m, --message       Commit message
      -p, --pause=true    Pause container during commit

## history

    Usage:	shed-image history [OPTIONS] IMAGE
    
    Show the history of an image
    
      -H, --human=true    Print sizes and dates in human readable format
      --help              Print usage
      --no-trunc          Don't truncate output
      -q, --quiet         Only show numeric IDs

## images

    Usage:	shed-image images [OPTIONS] [REPOSITORY[:TAG]]
    
    List images
    
      -a, --all          Show all images (default hides intermediate images)
      --digests          Show digests
      -f, --filter=[]    Filter output based on conditions provided
      --format           Pretty-print images using a Go template
      --help             Print usage
      --no-trunc         Don't truncate output
      -q, --quiet        Only show numeric IDs

## import

    Usage:	shed-image import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
    
    Import the contents from a tarball to create a filesystem image
    
      -c, --change=[]    Apply Dockerfile instruction to the created image
      --help             Print usage
      -m, --message      Set commit message for imported image

## load

    Usage:	shed-image load [OPTIONS]
    
    Load an image from a tar archive or STDIN
    
      --help             Print usage
      -i, --input        Read from a tar archive file, instead of STDIN

## purge

    Usage: shed-image purge [OPTIONS]
    
    Remove dangling images
    
      -f, --force=false    Force removal of the image
      --no-prune=false     Do not delete untagged parents

## rm

    Usage:	shed-image rm [OPTIONS] IMAGE [IMAGE...]
    
    Remove one or more images
    
      -f, --force        Force removal of the image
      --help             Print usage
      --no-prune         Do not delete untagged parents

## save

    Usage:	shed-image save [OPTIONS] IMAGE [IMAGE...]
    
    Save an image(s) to a tar archive (streamed to STDOUT by default)
    
      --help             Print usage
      -o, --output       Write to a file, instead of STDOUT

## tag

    Usage:	shed-image tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]
    
    Tag an image into a repository
    
      --help             Print usage

