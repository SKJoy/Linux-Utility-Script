# Linux / Utility / Script

A collection of utility scripts for Linux system management and maintenance. Each script should display the usage instruction when run, however, it is highly advised to check them for usage instructions before execution.

## Important
- `BASH` is required for this library to work. So, if not already installed, install `BASH` for your Linux instance;
	- Alpine: `apk add bash`
	- Debian: `apt-get install -y bash`
	- RHEL: `dnf install -y bash`
- This library must be cloned at `/Joy/Utility/Script` path in order to execute prebuilt scripts without issues. Otherwise, if the location changes, you must update the prebuilt scripts with the modified path.

## Usage

Usually you just need to execute them with `BASH` like `bash /Path/To/Script.sh`.

## Create your own script

You can create your own scripts in order to take advantage of the `Common.sh` utility that predefines a few common variables to be used inside your script. In this case, you must include the `Common.sh` script inside your own script. A sample is provided with the `Sample/My/Script.sh` script.

You can place your custom script anywhere on the system, at any path, just make sure you are including the correct `Common.sh` in your script.

## Linux distribution specific support
- Alpine
- Debian
- RHEL (CentOS, AlmaLinux, Rocky, etc.)

Scripts that do not use Linux distribution specific conditions may work without issues on any generic `*nix` system.

## Script
- `Update.sh`: Update (and upgrade) the Linux operating system and installed applications. Also automatically installs some tools like `cURL`, `WGet`, `SUDo`, `Nano`, `HTop`, `Midnight Commander`, etc.
	- Argument: `None`
- `Portainer-Agent-Run`: Creates and runs a `Docker` container for `Portainer Agent` that another `Portainer` instance can connect to and collect container information.
	- ### Argument
		- #### Agent secret
			- Required: `True`
			- Type: `STRING`
- `Tianji-Reporter-Install`: Install `Tianji reporter` agent to send system analytics to the `Tianji` server.
	- ### Argument
		- #### Server domain
			- Required: `True`
			- Type: `STRING`
			- Example: `tianji.domain.tld`
		- #### Workspace ID
			- Required: `True`
			- Type: `STRING`
			- Note: Get it from the `Tianji > Server > Add` button
- `Dockhand-Hawser-agent-install`: Install `Hawser agent` to report system analytics to to the `Dockhand` server. This is used for edge devices that are behind `LAN` or `NAT` where the `Dockhand` server cannot reach them directly.
	- ### Argument
		- #### Server domain
			- Required: `True`
			- Type: `STRING`
			- Example: `dockhand.domain.tld`
		- #### Token
			- Required: `True`
			- Type: `STRING`
			- Note: Generate it from the `Dockhand > Settings > Environments > Add environment` button

