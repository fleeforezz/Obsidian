**Create the `.desktop` file**:

```shell
nano ~/.local/share/applications/feishin.desktop
```

**Add the following content to the file**:

```shell
[Desktop Entry]
Name=Feishin
Comment=Feishin AppImage
Exec=/path/to/Feishin-0.7.3-linux-x86_64.AppImage
Icon=/path/to/icon.png
Terminal=false
Type=Application
Categories=Utility;
```

- Replace `/path/to/Feishin-0.7.3-linux-x86_64.AppImage` with the actual path to your Feishin AppImage.
- Replace `/path/to/icon.png` with the path to an icon you want to use, or leave it out if you don't have a specific icon.