# shed-volume

    Usage:	shed-volume [OPTIONS] [COMMAND]
    
    Manage Docker volumes
    
    Commands:
      create                   Create a volume
      inspect                  Return low-level information on a volume
      ls                       List volumes
      rm                       Remove a volume
    
    Run 'shed-volume COMMAND --help' for more information on a command
    
      --help             Print usage

# Commands

## create

    Usage:	shed-volume create [OPTIONS]
    
    Create a volume
    
      -d, --driver=local    Specify volume driver name
      --help                Print usage
      --name                Specify volume name
      -o, --opt=map[]       Set driver specific options

## inspect

    Usage:	shed-volume inspect [OPTIONS] VOLUME [VOLUME...]
    
    Return low-level information on a volume
    
      -f, --format       Format the output using the given go template
      --help             Print usage

## ls

    Usage:	shed-volume ls [OPTIONS]
    
    List volumes
    
      -f, --filter=[]    Provide filter values (i.e. 'dangling=true')
      --help             Print usage
      -q, --quiet        Only display volume names

## rm

    Usage:	shed-volume rm [OPTIONS] VOLUME [VOLUME...]
    
    Remove a volume
    
      --help             Print usage

