# My zsh configuration and tips

This repo contains some essential commands and configurations, which I use in my config files on my MacOS and Linux machines.

NOTE: on Linux, it may be necessary to install zsh (e.g., `sudo apt install zsh zplug`)

NOTE on MacOS:

- it is necessary to install `nano` from homebrew (using `brew install nano`)

- `git` can be installed within `Command Line Tools for Xcode` from [here](https://developer.apple.com/download/all/)

- [brew](https://brew.sh) package manager can be installed by:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Make zsh your default shell:

```chsh -s $(which zsh)```

(then logout and login)

Note: If you cannot run `chsh` due to permissions, you can add `zsh -l` at the end of `~/.bashrc`, see [here](https://github.com/neuropoly/computers/issues/447#issuecomment-1404109557)

## Location of `zshrc`

- `~/.zshrc`

## Download oh-my-zsh:

[Info](https://github.com/ohmyzsh/ohmyzsh#basic-installation)

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

oh-my-zsh is installed into `~/.oh-my-zsh`

plugins are located in `~/.oh-my-zsh/plugins`

custom plugins (e.g. zsh-autosuggestions) are located in `~/.oh-my-zsh/custom/plugins`

### zsh-autosuggestions:

Download/Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

On Linux:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Then add this plugin into your zshrc file

On MacOS:

```
brew install zsh-autosuggestions
```

Note: Follow the [instructions](https://brew.sh) to isntall `brew`.

Then add following line into `zshrc` file:

```
# Intel
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# M1
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

To ignore [insecure completion](https://github.com/ohmyzsh/ohmyzsh/issues/6461#issuecomment-438506394), it is necessary to add following lines at the beginning of the `zshrc` config file:

```
ZSH_DISABLE_COMPFIX=true

# Use modern completion system using shell function compinit
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Initialization
autoload -Uz compinit

# Silently ignore all insecure files and directories use the option
compinit -i
```

### zsh-syntax-highlighting

Install [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

On Linux:

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Then add this plugin into your zshrc file

On MacOS:

```
brew install zsh-syntax-highlighting
```

Then add following line into `zshrc` file:

```
# Intel
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# M1
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

## Location of `nanorc` 

- `~/.nanorc `

## Location of `.ssh/config`:

- `~/.ssh/config`

