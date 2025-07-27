# Rice: Gore_Magala

## Preview:

(https://github.com/Vitroror/dotfiles_VM/blob/main/img/showcase.png)

## 📖 Overview

This repo contains all the configuration files I use on my Wayland-based desktop (Hyprland) and the following utilities:

* **Fastfetch** (system info in terminal)
* **Hyprland** (Wayland compositor)
* **kitty** (terminal emulator)
* **nvim** (Neovim editor)
* **rofi** (application launcher)
* **waybar** (status bar)
  
## Usage

Before you begin, make sure you have:

1. **A Wayland-capable Linux distribution**
   (e.g., Arch, Fedora, openSUSE, etc.)

2. **Install packages**

   * `hyprland` + dependencies: `wlroots`, `wayland-protocols`, `xdg-desktop-portal-hyprland`
   * `waybar`
   * `rofi`
   * `kitty`
   * `neovim`
   * `fastfetch`
   * `hyprshot` (for screenshots)
   * `hyprlock`
   * Optional: `pavucontrol`, `blueman`, `network-manager-applet`

3. **Shell installation**
   * There is also a script that automatically installs zsh , oh-my-zsh and powerlevel10k for you simply run
   * `sudo chmod +x install-zsh-omz-p10k.sh`
   * `./install-zsh-omz-p10k.sh`
   * `exec zsh`
   * and it should work without much hassle. The script is set up to work with fedora's dnf, but adjusting it for pacman or apt should not be a problem

## Notes

* for GTK i have skipped trying to port it. I noticed that i cant be bothered to port these specific interfaces, so just as a reminder, if you're on a GNOME based distro like me just look for a theme you enjoy on gnome-look, dump the theme and icon files in the `.themes` and `.icons` folders, install `gnome-tweaks` if not installed, and set it up from there
* I have also added a separate script to install all nerd fonts, just in case you dont feel like asking ChatGPT like i do everytime i need to. The usage is the same as the powerlevel10k script
