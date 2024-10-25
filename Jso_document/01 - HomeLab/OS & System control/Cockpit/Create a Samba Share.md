> [!note]
> Make sure you have installed [[Third party repository]]
# Create ZFS storage pool

> Head to `ZFS` to create zfs pool 

![[ZFS config in cockpit.png]]

> Uncheck the SELinux option
> Change the Raid level by click on virtual device

## Create file-system for the pool

![[ZFS filesystem config.png]]

> Uncheck SELinux

# Create a group for specific user

> Head to `Identities` to manage user and group

### Create group

![[Create group in cockpit.png]]

### Create User (If you don't have one)

![[Asign group to user.png]]

> Assign user to the group we have created earlier.

### Set Samba password for user

![[Set Samba password.png]]

# Config Samba Share

> Head to `File Sharing` to create samba share

![[Samba Settings.png]]

> Set permissions and set owner for the path.

![[Samba permission.png]]

> Check the Window ACLs with Linux/MacOS Support. If we check that option we can connect via SMB through Linux or Mac.

![[Samba config for OSs.png]]

# After complete creating Samba share

> The default mount point will store at `/your-zfs-pool-name`

![[File Structure.png]]

> The image above has zfs pool name `Fish-Tank`

