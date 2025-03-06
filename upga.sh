#!/bin/sh

# Sets root perms for required commands
root_cmd="sudo"
if command -v doas >/dev/null 2>&1 ; then
    doas_check=$(doas id -u)
    if [ "$doas_check" = "0" ] ; then
        root_cmd="doas"
    fi
fi

# Arch Linux
if command -v paru >/dev/null 2>&1 ; then

  echo "Found paru"

    paru -Syu --devel

elif command -v yay >/dev/null 2>&1 ; then

  echo "Found yay"

    yay -Syu --devel

elif command -v pacman >/dev/null 2>&1 ; then

  echo "Found pacman (Warning! If you are using an AUR helper then it was not detected, please open an issue if you would like your AUR helper supported!)"

    $root_cmd pacman -Syu

fi

# Alpine Linux
if command -v apk >/dev/null 2>&1 ; then

  echo "Found apk (Warning! This tool does not update your Alpine release branch, please maintain this manually.)"

    $root_cmd apk update
    $root_cmd apk add --upgrade apk-tools # Recommended by Alpine Wiki https://wiki.alpinelinux.org/wiki/Upgrading_Alpine_Linux_to_a_new_release_branch
    $root_cmd apk upgrade --available
fi

# Brew
if command -v brew >/dev/null 2>&1 ; then

  echo "Found brew"

    brew update
    brew upgrade
fi

# Cargo
if command -v cargo >/dev/null 2>&1 ; then

  echo "Found cargo"

    cargo install $(cargo install --list | grep -E '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')
fi

# Debian
if command -v apt >/dev/null 2>&1 ; then

  echo "Found apt (Warning! This uses full-upgrade which will update your Debian version if there's an update available. If you do not want to update your debian release, cancel now and edit the upgrade command.)"

    $root_cmd apt update
    $root_cmd apt upgrade
fi

# Flatpak
if command -v flatpak >/dev/null 2>&1 ; then

  echo "Found flatpak"

    flatpak update
fi

# Gentoo
if command -v apt >/dev/null 2>&1 ; then

  echo "Found emerge"

    $root_cmd emaint -a sync
    $root_cmd emerge --ask --verbose --update --deep --newuse --with-bdeps=y @world

  echo "update complete, for your systems own safety, you will have to depclean yourself"
fi

# Fedora
if command -v dnf >/dev/null 2>&1 ; then

  echo "Found dnf (Warning! This will update your Fedora version if there's an update available. If you do not want to update your Fedora release, cancel now and comment out the 'dnf system-upgrade' line)"

    $root_cmd dnf upgrade
    $root_cmd dnf upgrade --refresh
    $root_cmd dnf system-upgrade
fi

# FreeBSD
if command -v freebsd-update >/dev/null 2>&1 ; then

  echo "Found freebsd-update (Warning! This will update your systems release version. If you do not want to update your release version, cancel now and comment out the 'freebsd-update' lines. Continuing in 10 seconds)"

    sleep 10s

    $root_cmd freebsd-update fetch
    $root_cmd freebsd-update install
fi

if command -v pkg >/dev/null 2>&1 ; then

  echo "Found pkg"

    $root_cmd pkg update
    $root_cmd pkg upgrade
fi

# npm
if command -v npm >/dev/null 2>&1 ; then

  echo "Found npm"

    npm update
fi

# pipx
if command -v pipx >/dev/null 2>&1 ; then

  echo "Found pipx"

    pipx upgrade-all
fi

# Rustup
if command -v rustup >/dev/null 2>&1 ; then

  echo "Found rustup"

    rustup update
fi

# Void
if command -v xbps-install >/dev/null 2>&1 ; then

  echo "Found xbps-install"

    $root_cmd xbps-install -Su
fi

echo "All updates complete!"
