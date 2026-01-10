# 🧾 `Linux` / **Utility** / Script

A collection of utility scripts for Linux system management and maintenance. Each script should display the usage instruction when run, however, it is highly advised to check them for usage instructions before execution.

## 🔔 Important
- `BASH` (and `GIT`) are required for this library to work. So, if not already installed, install them for your Linux instance;
	- Alpine: `apk add bash git`
	- Debian: `apt-get install -y bash git`
	- RHEL: `dnf install -y bash git`
- This library must be cloned at `/Joy/Utility/Script` path in order to execute prebuilt scripts without issues. Otherwise, if the location changes, you must update the prebuilt scripts with the modified path.
- This is a **continuous** `work in progress`

## 🔨 Usage

Usually you just need to execute them with `BASH` like `bash /Path/To/Script.sh`.

- ### Install
	- GIT: `git clone https://github.com/SKJoy/Linux-Utility-Script.git /Joy/Utility/Script`
	- Manual: Download and place all files in `/Joy/Utility/Script` path
- **Example** use: `bash /Joy/Utility/Script/Sample/My/Script.sh`
- Add to path if you want to be able to call the scripts without using the installation path
	- Add `export PATH="$PATH:/Joy/Utility/Script"` line into `~/.bashrc` file (or `~/.zshrc`/`~/.kshrc`)
	- Activate immediately without a reboot: `source ~/.bashrc` (or `~/.zshrc`/`~/.kshrc`)
- Update: `cd /Joy/Utility/Script && git pull`

## 📝 Create your own script

You can create your own scripts in order to take advantage of the `Common.sh` utility that predefines a few common variables to be used inside your script. In this case, you must include the `Common.sh` script inside your own script. A sample is provided with the `Sample/My/Script.sh` script.

You can place your custom script anywhere on the system, at any path, just make sure you are including the correct `Common.sh` in your script.

## 💡 Linux distribution specific support
- Alpine
- Debian (Ubuntu, etc.)
- RHEL (CentOS, AlmaLinux, Rocky, etc.)

Scripts that do not use Linux distribution specific conditions may work without issues on any generic `*nix` system.

## 📚 Script
- **`Update`**: Update (and upgrade) the Linux operating system and installed applications. Also automatically installs some tools like `cURL`, `WGet`, `SUDo`, `Nano`, `HTop`, `Midnight Commander`, etc.
- **`Set-default-editor`**: Set `Nano` as the default **CLI** editor
- **`Trim-files`**: Trim files to `ZERO` byte size
	- ### 📌 Argument
		- **Maximum depth**: Required: `Optional`; Type: 🔢 `INTEGER`; Default: `3`
		- **Base path**: Required: `Optional`; Type: 🔤 `STRING`; Default: `/`
		- **File extension**: Required: `Optional`; Type: 🔤 `STRING`; Default: `log`
- **`Portainer-Agent-Run`**: Creates and runs a `Docker` container for `Portainer Agent` that another `Portainer` instance can connect to and collect container information.
	- ### 📌 Argument
		- **Agent secret**: Required: `True`; Type: 🔤 `STRING`; **Note**: As defined in the target `Portainer` portal.
- **`Tianji-Reporter-Install`**: Install `Tianji reporter` agent to send system analytics to the `Tianji` server.
	- ### 📌 Argument
		- **Server domain**: Required: `True`; Type: 🔤 `STRING`; Example: `tianji.domain.tld`
		- **Workspace ID**: Required: `True`; Type: 🔤 `STRING`; **Note**: Get it using `Tianji > Server > Add` button
- **`Dockhand-Hawser-agent-install`**: Install `Hawser agent` to report system analytics to to the `Dockhand` server. This is used for **edge devices** that are behind `LAN` or `NAT` where the `Dockhand` server cannot reach them directly.
	- ### 📌 Argument
		- **Server domain**: Required: `True`; Type: 🔤 `STRING`; Example: `dockhand.domain.tld`
		- **Token**: Required: `True`; Type: 🔤 `STRING`; **Note**: Generate it using `Dockhand > Settings > Environments > Add environment` button

