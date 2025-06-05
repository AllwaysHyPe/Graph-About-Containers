# Graph About Containers

**Run Microsoft Graph PowerShell automation in isolated containers, with no mess.**

This repo helps you spin up disposable, containerized environments to test Microsoft Graph PowerShell scripts. It's built on [Justin Grote’s hardened PowerShell containers](https://github.com/JustinGrote/PowerShell-Containers) and uses [ModuleFast](https://github.com/JustinGrote/ModuleFast) to install script dependencies from your `#requires` block at build time.

No more module conflicts. No more cluttered systems. Just clean, repeatable automation testing.


## 🚀 Why this repo exists

You're writing Microsoft Graph PowerShell scripts, but:
- You don't want to pollute your host with a dozen module versions.
- You want to test things quickly, safely, and in isolation.
- You want to treat your test environments like **cattle, not pets**.

This gives you a clean container-based workflow:
- Build a container from your script.
- Dependencies are installed automatically.
- Run your script.
- Tear it all down.

It works great with DevContainers too, so you can test and explore from Codespaces or VS Code.


## 🧪 What’s inside (still building this out)

- `Scripts/` – testable containers where the script defines module dependencies using `#requires -Module` and `ModuleFast` installs them at build time
- `containers/` – individual container projects, each with its own `Dockerfile` and `main.ps1` (coming soon)
- `examples/` – reusable Graph automation scripts you can drop into container folders (coming soon)


## 🧼 Clean dev practices
- Everything runs in Linux-based PowerShell 7 containers
- Graph modules are installed in `/home/app/.local/share/powershell/Modules`
- Scripts use `#requires -Module` to declare dependencies cleanly
- ModuleFast installs only what’s needed at build time


## 💡 Tip: Use with DevContainers
This repo uses the Justin Grote's [.devcontainer.json](https://github.com/JustinGrote/PowerShell-Containers/tree/main/.devcontainer) enabling GitHub Codespaces or a local `.devcontainer` setup, so you can:
- Edit your PowerShell script
- Build and run a test container
- Keep your local machine untouched

DevContainer setup coming soon.


## 🔧 What’s next
- Containerized Graph samples for:
  - Device and group queries
  - Intune app/package uploads
  - Intune settings configuration
- DevContainer support
- GitHub Actions CI

