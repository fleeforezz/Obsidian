# For Linux

## Install

> Check update

```shell
sudo apt update
```

> Install zsh 

```shell
sudo apt install zsh -y
```

> Check version

```shell
zsh --version
```

## Initial Configuration

```shell
zsh
```

![[Pasted image 20240304121042.png]]

- Press **1** to go to the main menu and configure each setting individually.
- Press **2** to populate the *.zshrc* configuration file with the default parameters, which you can later change manually in the *.zshrc* file.
- Press **0** to create an empty *.zshrc* configuration file and configure everything from scratch.
- Press **q** to exit the configuration and start it again the next time you enter Zsh.

⇒ In this config i’ll choose option 2 for ez 😀

## Set zsh as Default Shell

> By default after install zsh shell will not set 

```shell
echo $SHELL
```

> If it already set to zsh u can pass this line 🙂 otherwise u have to continue this process 

```shell
chsh -s [path] [user]
```

- **`[path]`** specifies the path to the shell you want to use.
- **`[user]`** specifies the user for which you want to change the default shell. Not specifying the user changes the default shell for the current user.

```shell
chsh -s $(which zsh) [user]
```

> Restart terminal to see changes

## Install Oh-My-Zsh

> Install Oh-My-Zsh

```shell
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

## Add a custom theme

```shell
sudo nano ~/.zshrc
```

> Locate the following location

```shell
ZSH_THEME="robbyrussell"
```

## Enable Auto-Suggestions

> Add the auto-suggestion plugin repository first.

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

> A little tweaks in ,zshrc

```shell
sudo nano ~/.zshrc
```

> Add this line 

```shell
plugins=(git zsh-autosuggestions)
```

⇒ Restart the terminal

## **Enable Syntax Highlighting**

> Clone the plugin repository

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

> Again !! A little tweaks in .zshrc

```shell
sudo nano ~/.zshrc
```

Scroll down to the plugins section and add **`zsh-syntax-highlighting`** to the list of plugins

![[Pasted image 20240304121358.png]]

⇒ Restart the terminal

## Uninstall ZSH

```shell
sudo apt --purge remove zsh
```

> Change the default shell to default

```shell
chsh -s $(which bash) [user]
```