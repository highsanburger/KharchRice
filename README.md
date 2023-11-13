# KharchRice

“The philosophers have only interpreted the Arch of Linux, in various ways. The point, however, is to rice the Arch of Linux."


## Installing

On an Arch-based distribution as root, run the following:

```
curl -LO https://raw.githubusercontent.com/highsanburger/KharchRice/main/karbs.sh
sh karbs.sh
```
_exactus_

## What is KARBS?

KARBS is a script that autoinstalls and autoconfigures a fully-functioning
and minimal terminal-and-vim-based Arch Linux environment.

KARBS can be run on a fresh install of Arch Linux, and provides you
with a fully configured diving-board for work or more customization.

## Getting Started

Press `super + Space` to open up a terminal emulator. Now open the the file `~/.config/sxhkd/sxhkdrc` in your fav editor. This is where all the keybinds are configured. The file is heavily populated with a lot of scripts which are located in `~/.local/bin/`.  Also press q to the zsh customizing prompt and just type `source ~/.config/zsh/.zshrc` to get the most elegant shell config of all time.

### Programs used
KARBS automatically installs and configures the following (simply rad) programs:

| Program  | Description |   
|-------------- | -------------- |
|bspwm|"only truly CHAD Tiling Window manager for maximizing productivitytytytyt"|
|sxhkd|"once you go sxhkd your fingers go athritis, from overdosing on your epic keyboard based workflow"|
|dunst|"is a suckless notification system."|
|betterlockscreen|"allows you to lock your computer and quickly unlock with your password."|
|alacritty| "G.O.A.T. $TERMINAL ! ! !"|
|lf|"Hella Extendable TUI File manager which literally embodies the Holy Ghost"|
|picom|"for your OMG HOW DOES YOUR COMPI LOOK LIKE THAT needs"|
|polybar|"dont waste your time ricing this lol"|
|rofi|"cheap but flashy dmenu clone"|
|zsh|"GODSENT sheell"|
|mpv|"is the patrician's choice video player."|
|zathura|"is a pdf viewer with vim-like bindings."|

### The X headache.
After logging in to the shell, and upon entering `startx` the `~/.xinitrc` script will be run. In it we have started a bunch of daemons and most importantly in the last line have started our window manager `bspwm`. In its configuration file located at `~/.config/bspwm/bspwmrc` we have source `~/.xprofile` which I have arbitrarily decided to make the main file for exporting global variables. I know this isn't the most elegant solution and am open to hear your ideas.
Just go through the aforementioned files to familiarize yourself with the setup of the system.


## Customization

By default, KARBS uses the programs [here in progs.csv](progs.csv) and installs
my dot files but you can easily change this by  modifying the default variables at the
beginning of the script.


### The `progs.csv` list

KARBS will parse the given programs list and install all given programs. Note
that the programs file must be a three column `.csv`.

The first column is a "tag" that determines how the program is installed, ""
(blank) for the main repository, `A` for via the AUR or `G` if the program is a
git repository that is meant to be `make && sudo make install`ed.

The second column is the name of the program in the repository, or the link to
the git repository, and the third column is a description (should be a verb
phrase) that describes the program. During installation, KARBS will print out
this information in a grammatical sentence. It also doubles as documentation
for people who read the CSV and want to install my dotfiles manually.

Depending on your own build, you may want to tactically order the programs in
your programs file. KARBS will install from the top to the bottom.

If you include commas in your program descriptions, be sure to include double
quotes around the whole description to ensure correct parsing.

### The script itself

The script is extensively divided into functions for easier readability and
trouble-shooting. Most everything should be self-explanatory.

The main work is done by the `installationloop` function, which iterates
through the programs file and determines based on the tag of each program,
which commands to run to install it. You can easily add new methods of
installations and tags as well.

Note that programs from the AUR can only be built by a non-root user. What
KARBS does to bypass this by default is to temporarily allow the newly created
user to use `sudo` without a password (so the user won't be prompted for a
password multiple times in installation). This is done ad-hocly, but
effectively with the `newperms` function. At the end of installation,
`newperms` removes those settings, giving the user the ability to run only
several basic sudo commands without a password (`shutdown`, `reboot`,
`pacman -Syu`).


## TODO 
- betterlockscreen -u ~/.wallpapers/socrates.jpg 
- fusuma 
