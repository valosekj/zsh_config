## Install iPython on MacOS

```
$ pip3 install ipython
```

### Import favourite libraries during iPython startup:

Navigate to iPython startup config directory:

```
$ cd ~/.ipython/profile_default/startup
```

Create a new script `start.py` with the following lines:

```
import os
import pandas as pd
import numpy as np

# Pandas options
pd.options.display.max_columns = 30
pd.options.display.max_rows = 20

from IPython import get_ipython
ipython = get_ipython()

# If in ipython, load autoreload extension
if 'ipython' in globals():
    print('\nWelcome to IPython!')
    ipython.magic('load_ext autoreload')
    ipython.magic('autoreload 2')

print('Libraries have been loaded.')
```

### Create iPython config file:

Config file is located in `~/.ipython/profile_default/ipython_config.py`, example:

```
# iPython config file

# Set nano as a default editor for %edit command
c.InteractiveShell.editor = 'nano'

# Allow interactive plot displaying  
c.InteractiveShellApp.matplotlib = 'osx'
```

Example of config file - [here](https://ipython.readthedocs.io/en/stable/config/intro.html#example-configuration-file)
