<h1 align="center">
    <img alt="banner" src="res/upga_banner.svg">
</h1>

Upgrade all of your installed packages!

upga is a simple shell script which checks which package managers you have installed and updates all packages installed through them. Currently, upga supports package managers found in Linux, FreeBSD, and MacOS. If you would like a package manager or operating system to be supported, please feel free to open an issue or a pull request!

For your systems own safety, this script will warn you ahead of time for possibly unwanted actions such as updating the release version.

To get started with upga you must clone this repository and run `upga.sh`. An all in one command for this can be copied below:

`git clone https://github.com/Stoppedpuma/upga && chmod +x upga/upga.sh && ./upga/upga.sh`

Currently supported package managers:

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
- rustup
- xbps
