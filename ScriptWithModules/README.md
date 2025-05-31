# Script with Modules

This folder shows how to test a PowerShell script that depends on the `Microsoft.Graph.Authentication` module without installing anything on your host. It uses [ModuleFast](https://github.com/JustinGrote/ModuleFast) to install dependencies at container build time, based on the `#requires -Module` line in your script.

This is not about doing something complex, it’s about setting up clean, disposable containers that let you verify your script works with the modules it depends on. You build it, run it, and throw it away when you're done. No mess.

## Why I built this
If you’re doing Graph automation, you probably don’t want to:
- Pollute your dev machine with module installs
- Worry about version mismatches
- Manually clean up after tests

This setup lets you treat your Graph scripting like cattle, not pets. Build what you need, test in isolation, and move on.

## What’s going on
- The `main.ps1` script declares a `#requires -Module` directive for `Microsoft.Graph.Authentication`.
- The Dockerfile uses Justin Grote’s hardened PowerShell container as the base image.
- During the build step, ModuleFast scans `main.ps1` and installs the required module into `/home/app`.
- When you run the container, it just runs `main.ps1`.

### ⚠️ Heads-up on Podman
While Justin’s base container is Docker-compatible, I ran into issues with Docker’s handling of `RUN` instructions in heredoc or inline script form. Podman worked reliably during testing, so for now the instructions below use `podman`. Once Justin updates his container to avoid the `/bin/sh` dependency, I’ll revisit and re-add Docker instructions.

## Using the latest module version

By default, this example just installs the **latest** version of the `Microsoft.Graph.Authentication` module available from the PowerShell Gallery. If you want to pin a specific version — or include multiple modules at exact versions — check out [Justin Grote’s PowerShell-Containers repo](https://github.com/JustinGrote/PowerShell-Containers) for detailed examples.

## How to use it
```bash
podman build -t graph-auth-check .
podman run graph-auth-check
```

You’ll see output that confirms the module was installed and shows its version and path. Super simple, and no impact to your local PowerShell environment.

This pattern is what I’m using to validate other Microsoft Graph automation scripts. Feel free to copy and tweak it for your own use.
