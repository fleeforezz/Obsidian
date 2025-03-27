> Can you use dash. without mounting the whole host drive?

Yes, you can - the mount is only needed to make it easier for the user, but you can manually mount the relevant parts into the container as well.

For this you need to use the following volume mounts:

- `/etc/os-release:/mnt/host/etc/os-release:ro` for reading the OS version of the host
- `/proc/1/ns/net:/mnt/host/proc/1/ns/net:ro` for reading the Network usage of the host
    - alternatively, you can just bind the container to the host network using `-net=host`, but this is not recommended, because it messes with Dockers internal networking
- `/mnt:/mnt/host/mnt:ro` and `/media:/mnt/host/media:ro` for reading the usage stats of all drives
    - keep in mind that this covers only the most basic mount paths of linux. if your system uses other mount paths, you will need to manually add them to the list of volumes, following the pattern `/xxx:/mnt/host/xxx:ro`. To check where all your mounts are on your system, you can use the command `df` and run it in a shell.