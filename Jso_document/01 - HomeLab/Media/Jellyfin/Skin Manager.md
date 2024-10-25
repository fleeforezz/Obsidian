1. In jellyfin, go to dashboard -> plugins -> Repositories -> add and paste this link [https://raw.githubusercontent.com/danieladov/JellyfinPluginManifest/master/manifest.json](https://raw.githubusercontent.com/danieladov/JellyfinPluginManifest/master/manifest.json)
2. Go to Catalog and search for Skin Manager
3. Click on it and install
4. Restart Jellyfin

Custom CSS:

- Default:

```shell
@import url("<https://prayag17.github.io/JellyFlix/default.css>");
```

- With logo:

```shell
@import url("<https://prayag17.github.io/JellyFlix/default.css>"); @import url("<https://prayag17.github.io/JellyFlix/Logo.css>");
```