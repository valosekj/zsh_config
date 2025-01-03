# Install `pyenv` on MacOS

1. Run the following command in the CLI:

```
$ curl https://pyenv.run | bash
```
 
Then add the following lines to your `zshrc` file:

```
# Define environment variable PYENV_ROOT
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Enable shims and autocompletion
if command -v pyenv 1>/dev/null 2>&1;then
  eval "$(pyenv init -)"
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

```

You can then check your `$(pyenv root)` variable:

```
$ echo $(pyenv root)
```

And install a specific version of python:

```
$ pyenv install 3.7.0
```
