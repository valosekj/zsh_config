The `.ssh/config` file contains options for the ssh command.

Example of `.ssh/config` file:

```
Host <name>
    HostName <host_name>
    User <user_name>
    Port <port_number>
    Identityfile <ssh_key>
```

Then you can type in your terminal simply `$ ssh <name>`, and all options are passed from the `.ssh/config` file.
