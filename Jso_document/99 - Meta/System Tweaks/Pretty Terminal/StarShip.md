# Linux

```shell
sudo apt install curl
```

```shell
curl -sS https://starship.rs/install.sh | sh
```

### Config for users :

```jsx
sudo nano ~/.bashrc
```

```jsx
eval "$(starship init bash)"
```

### Config for root :

`Same steps` 

# For Window

```powershell
choco install starship
```

```powershell
code $profile
```

```powershell
Invoke-Expression (&starship init powershell)
```

⇒ Restart terminal to take effect

### Config [ for powershell ]

Create a .toml file and paste this code

```toml
# ~/.config/starship.toml

# Inserts a blank line between shell prompts
add_newline = true

# Change the default prompt format
format = """\
[╭╴](238)$os\
$all[╰─](238)$character"""

# Change the default prompt characters
[character]
success_symbol = "[](238)"
error_symbol = "[](238)"

# No need for env variables as starship provides a way to show your current distro
[os]
format ='[$symbol](bold white)'   
disabled = false

[os.symbols]
Windows = " "
Arch = "󰣇"
Ubuntu = ""

# Shows the username
[username]
style_user = "white bold"
style_root = "black bold"
format = "[$user]($style) "
disabled = true  # disable in powershell
show_always = false

[directory]
truncation_length = 3
truncation_symbol = "…/"
home_symbol = "󰋞 ~"
read_only_style = "197"
read_only = "  "
format = "at [$path]($style)[$read_only]($read_only_style) "

[git_branch]
symbol = "󰊢 "
format = "on [$symbol$branch]($style) "
truncation_length = 4
truncation_symbol = "…/"
style = "bold green"

[git_status]
format = '[\($all_status$ahead_behind\)]($style) '
style = "bold green"
conflicted = "🏳"
up_to_date = " "
untracked = " "
ahead = "⇡${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
behind = "⇣${count}"
stashed = "󰏗 "
modified = " "
staged = '[++\($count\)](green)'
renamed = "󰖷 "
deleted = " "

[terraform]
format = "via [ terraform $version]($style) 壟 [$workspace]($style) "

[vagrant]
format = "via [ vagrant $version]($style) "

[docker_context]
format = "via [ $context](bold blue) "

[helm]
format = "via [ $version](bold purple) "

[python]
symbol = "󰌠 "
python_binary = "python3"

[nodejs]
format = "via [󰎙 $version](bold green) "
disabled = true

[ruby]
format = "via [ $version]($style) "

[kubernetes]
format = 'on [ $context\($namespace\)](bold purple) '
disabled = false
[kubernetes.context_aliases]
"clcreative-k8s-staging" = "cl-k8s-staging"
"clcreative-k8s-production" = "cl-k8s-prod"
```

> Point the starship.toml file into this command

> For window :

```powershell
$ENV:STARSHIP_CONFIG = "$HOME\example\non\default\path\starship.toml"
```

> For Linux :

```shell
export STARSHIP_CONFIG=~/example/non/default/path/starship.toml
```