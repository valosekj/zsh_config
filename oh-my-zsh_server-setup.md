# oh-my-zsh setup on a server (without sudo)


1. Clone oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Clone zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions /home/GRAMES.POLYMTL.CA/p118175/.zsh/zsh-autosuggestions
```

3. Copy desired .zshrc file to your `~/` directory

4. Add the following line at the end of `.bashrc`:

```
zsh -l
```

5. Deactivate default conda env

```
conda config --set auto_activate_base false
```
