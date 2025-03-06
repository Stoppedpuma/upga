<h1 align="center">
    <img alt="banner" src="res/upga_banner.svg">
</h1>

Upgrade all of your installed packages!

upga is a simple shell script that checks which package managers you have installed and updates all packages installed through them. Currently, upga supports most major package managers found in Linux, FreeBSD, and MacOS.

For your systems own safety, this script will warn you ahead of time for possibly unwanted actions such as updating the release version.

### Getting Started

To get started with upga clone this repository and run `upga.sh`. An all in one command for this can be copied below:

```shell
git clone https://github.com/Stoppedpuma/upga && chmod +x upga/upga.sh && ./upga/upga.sh
```

From here, you can choose to setup an alias in your shells configuration to point towards the upga script, this lets you run upga in your shell from anywhere!

# Supported platforms

Most major package managers are currently supported. If you would like a package manager or operating system to be supported, please feel free to open an issue or a pull request! A complete list of supported package managers can be seen below:

- apk
- apt
- brew
- dnf
- cargo
- emerge
- flatpak
- npm
- pacman (+ paru and yay)
- pipx
- pkg (+ freebsd-update)
- snap
- rustup
- xbps
