# Install
## Window
### Terminal

>Run the terminal as admin and download package from oh-my-posh

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

> Install font :

```powershell
oh-my-posh font install
```

> Add prompt environment

```powershell
code $profile
```

```powershell
oh-my-posh.exe init pwsh --config [ where you store the theme.json file ] | Invoke-Expression
```

> Change font in Terminal :

Open terminal —> select profile —> font face —> change to the font you installed

### VScode

> Press `ctrl + shift + p` to open the user setting
> Edit 2 line 

```shell
"editor.fontFamily": "Consolas", // All VSCode font
"terminal.integrated.fontFamily": "CaskaydiaCove NF", // Terminal font
```

## Linux
### Install Oh-My-Posh

```shell
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
```

```shell
sudo chmod +x /usr/local/bin/oh-my-posh
```

```shell
mkdir ~/.poshthemes
```

```shell
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
```

```shell
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
```

```shell
chmod u+rw ~/.poshthemes/*.omp.*
```

```shell
rm ~/.poshthemes/themes.zip
```

### Add theme in .bashrc

```shell
sudo nano ~/.bashrc
```

```shell
eval "$(oh-my-posh init bash --config /home/nhat/.poshthemes/{themes}.omp.json)"
```

### Fonts

```shell
mkdir .fonts
```

```shell
unzip ~/Downloads/Font-name.zip -d ~/.fonts/Fontname
```

```shell
fc-cache -fv
```