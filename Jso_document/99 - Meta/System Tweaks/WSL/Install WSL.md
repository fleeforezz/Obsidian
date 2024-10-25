1. Enable Virtualize in BIOS 
2. Open search menu and type “Turn window features on or off” and find Window subsystem for Linux
3. Paste this command into window terminal (Admin)

```powershell
wsl --install
```

List all linux ditro

```powershell
wsl --list --online
```

Install a Distro:

```powershell
wsl --install -d <distro>
```

Restart the your desktop