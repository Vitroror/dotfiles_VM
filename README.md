# dotfiles\_WM

Dotfiles and configs for my personal Wayland/Hyprland desktop setup.

## 📖 Overview

This repo contains all the configuration files I use on my Wayland-based desktop (Hyprland) and the following utilities:

* **Fastfetch** (system info in terminal)
* **Hyprland** (Wayland compositor)
* **kitty** (terminal emulator)
* **nvim** (Neovim editor)
* **rofi** (application launcher)
* **waybar** (status bar)

---

## 📦 Prerequisites

Before you begin, make sure you have:

1. **A Wayland-capable Linux distribution**
   (e.g., Arch, Fedora, openSUSE, etc.)

2. **Installed packages**

   * `hyprland` + dependencies: `wlroots`, `wayland-protocols`, `xdg-desktop-portal-hyprland`
   * `waybar`
   * `rofi`
   * `kitty`
   * `neovim`
   * `fastfetch`
   * `wl-clipboard`
   * `hyprshot` (for screenshots)
   * `swaylock` or `hyprlock` if using `hyprlock`
   * Optional: `pavucontrol`, `blueman`, `network-manager-applet`

3. **Fonts**
   Install your favorite Nerd Font (e.g., `ttf-nerd-fonts-symbols`) for icons in bars/rofi.

## 🔍 Config Breakdown

Below is a high‑level look at what each folder contains and any extra steps:

### 1. fastfetch

* **Files:**

  * `config.jsonc` — layout, colors, modules
  * `logo` — ASCII art logo
* **Usage:**

  * Run `fastfetch` in your shell (e.g., in `.bashrc` or `kitty.conf`).

### 2. hypr (Hyprland)

* **Files:**

  * `hyprland.conf` — main Wayland compositor settings (workspaces, gaps, keybinds)
  * `hyprlock.conf` — screen locker settings
  * `hyprpaper.conf` — wallpaper daemon config
  * `wall.jpg` — default wallpaper
* **Usage:**

  * Launch with `Hyprland` or via a display manager.
  * Ensure you have `hyprpaper` installed for wallpaper auto‑reload.

### 3. kitty

* **Files:**

  * `kitty.conf` — main config
  * `current-theme.conf` — color palette include
  * `diff.conf` — special overrides
* **Usage:**

  * Edit `kitty.conf` to point at your font.
  * Use `include current-theme.conf` to switch themes quickly.

### 4. nvim (Neovim)

* **Files:**

  * `init.lua` — bootstrap + plugin manager (`lazy.nvim`)
  * `lua/` — plugin configs (LSP, Telescope, Treesitter, Harpoon, etc.)
  * `lazy-lock.json` — lockfile for reproducible plugin versions
* **Usage:**

  * Requires `git`, `nodejs` and any LSP servers you want (e.g., `clangd`, `pyright`).
  * Launch with `nvim` and run `:Lazy sync` on first install.

### 5. rofi

* **Files:**

  * `config.rasi` — main settings
  * `catppuccin-*.rasi` — theme files for Catppuccin colors
* **Usage:**

  * Launch with a keybind (from `hyprland.conf`), e.g. `rofi -show drun -config ~/.config/rofi/config.rasi`.

### 6. waybar

* **Files:**

  * `config/` — JSON menus and modules (network, battery, time)
  * `*.css` — styles for Catppuccin flavours
  * `power_menu.xml` — logout/shutdown menu
  * `scripts/` — helper scripts (e.g., `cpu_temp.sh`)
* **Usage:**

  * Ensure executable bit on any scripts (`chmod +x`).
  * Auto‑start `waybar` in your Hyprland autostart.

---

## 📝 Notes & Tips

* **Autostart**
  Add to your `~/.config/hypr/autostart`:

  ```sh
  hyprpaper --config ~/.config/hypr/hyprpaper.conf &
  waybar --config ~/.config/waybar/config &
  ```
* **Lock screen**
  Bind a key in `hyprland.conf`:

  ```ini
  bind = SUPER+L, exec, hyprlock
  ```
* **Switch themes**
  Each Catppuccin flavour is self‑contained. To switch:

  ```sh
  ln -sf ~/.config/rofi/catppuccin-mocha.rasi ~/.config/rofi/current-theme.rasi
  # reload rofi or relaunch
  ```

---

## 📮 Contact

Have questions or suggestions? Open an issue or reach out at [your.email@example.com](mailto:your.email@example.com).
