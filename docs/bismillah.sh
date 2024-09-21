#!/bin/sh

dotfilesrepo="https://github.com/highsanburger/KharchRice.git"
progsfile="https://raw.githubusercontent.com/highsanburger/KharchRice/main/progs.csv"

installpkg() {
	pacman --noconfirm --needed -S "$1" >/dev/null 2>&1
}

error() {
	# Log to stderr and exit with failure.
	printf "%s\n" "$1" >&2
	exit 1
}

manualinstall() {
	# Installs $1 manually. Used only for AUR helper here.
	# Should be run after repodir is created and var is set.
	pacman -Qq "$1" && return 0
	whiptail --infobox "Installing \"$1\" manually." 7 50
	sudo -u "$name" mkdir -p "$repodir/$1"
	sudo -u "$name" git -C "$repodir" clone --depth 1 --single-branch \
		--no-tags -q "https://aur.archlinux.org/$1.git" "$repodir/$1" ||
		{
			cd "$repodir/$1" || return 1
			sudo -u "$name" git pull --force origin master
		}
	cd "$repodir/$1" || exit 1
	sudo -u "$name" -D "$repodir/$1" \
		makepkg --noconfirm -si >/dev/null 2>&1 || return 1
}

maininstall() {
	# Installs all needed programs from main repo.
	whiptail --title "LARBS Installation" --infobox "Installing \`$1\` ($n of $total). $1 $2" 9 70
	installpkg "$1"
}

gitmakeinstall() {
	progname="${1##*/}"
	progname="${progname%.git}"
	dir="$repodir/$progname"
	whiptail --title "LARBS Installation" \
		--infobox "Installing \`$progname\` ($n of $total) via \`git\` and \`make\`. $(basename "$1") $2" 8 70
	sudo -u "$name" git -C "$repodir" clone --depth 1 --single-branch \
		--no-tags -q "$1" "$dir" ||
		{
			cd "$dir" || return 1
			sudo -u "$name" git pull --force origin master
		}
	cd "$dir" || exit 1
	make >/dev/null 2>&1
	make install >/dev/null 2>&1
	cd /tmp || return 1
}

aurinstall() {
	whiptail --title "LARBS Installation" \
		--infobox "Installing \`$1\` ($n of $total) from the AUR. $1 $2" 9 70
	echo "$aurinstalled" | grep -q "^$1$" && return 1
	sudo -u "$name" $aurhelper -S --noconfirm "$1" >/dev/null 2>&1
}

pipinstall() {
	whiptail --title "LARBS Installation" \
		--infobox "Installing the Python package \`$1\` ($n of $total). $1 $2" 9 70
	[ -x "$(command -v "pip")" ] || installpkg python-pip >/dev/null 2>&1
	yes | pip install "$1"
}

installationloop() {
	([ -f "$progsfile" ] && cp "$progsfile" /tmp/progs.csv) ||
		curl -Ls "$progsfile" | sed '/^#/d' >/tmp/progs.csv
	total=$(wc -l </tmp/progs.csv)
	aurinstalled=$(pacman -Qqm)
	while IFS=, read -r tag program comment; do
		n=$((n + 1))
		echo "$comment" | grep -q "^\".*\"$" &&
			comment="$(echo "$comment" | sed -E "s/(^\"|\"$)//g")"
		case "$tag" in
		"A") aurinstall "$program" "$comment" ;;
		"G") gitmakeinstall "$program" "$comment" ;;
		"P") pipinstall "$program" "$comment" ;;
		*) maininstall "$program" "$comment" ;;
		esac
	done </tmp/progs.csv
}

# Allow user to run sudo without password. Since AUR programs must be installed
# in a fakeroot environment, this is required for all builds with AUR.
trap 'rm -f /etc/sudoers.d/larbs-temp' HUP INT QUIT TERM PWR EXIT
echo "%wheel ALL=(ALL) NOPASSWD: ALL
Defaults:%wheel,root runcwd=*" >/etc/sudoers.d/larbs-temp

# Make pacman colorful, concurrent downloads and Pacman eye-candy.
grep -q "ILoveCandy" /etc/pacman.conf || sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
sed -Ei "s/^#(ParallelDownloads).*/\1 = 5/;/^#Color$/s/#//" /etc/pacman.conf

# Use all cores for compilation.
sed -i "s/-j2/-j$(nproc)/;/^#MAKEFLAGS/s/^#//" /etc/makepkg.conf

manualinstall "yay" || error "Failed to install AUR helper."

installationloop

curl -LO $progsfile

git clone $dotfilesrepo

mv $dotfilesrepo /home/khal

chsh -s /bin/zsh "$name" >/dev/null 2>&1
sudo -u "$name" mkdir -p "/home/$name/.cache/zsh/"
