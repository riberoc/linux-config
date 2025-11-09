# linux-config

Curated Linux setup for my Kitty terminal configuration and a few bootstrap scripts to recreate the environment on a fresh machine.

## Features

- Preconfigured Kitty profile (`configs/kitty/`) with JetBrains Mono, theme presets, and my preferred defaults.
- Installer scripts for apt-based distributions:
  - `installers/kitty-install.sh` installs Kitty if needed, registers it with `update-alternatives`, and syncs this repo's config into `~/.config/kitty`.
  - `installers/basic-utils.sh` installs ImageMagick and other base utilities I expect to have available.
- Backup helper `save-current-configs/save-kitty-config.sh` to capture your current Kitty config back into the repo.

## Repository Layout

- `configs/kitty/` – main Kitty configuration (`kitty.conf`) plus theme overrides and backups.
- `installers/` – bootstrap scripts to set up applications.
- `save-current-configs/` – scripts that grab the live configuration from `~/.config`.

## Prerequisites

- Debian/Ubuntu (or any distro with `apt`) for the installer scripts.
- `curl` available for fetching the Kitty installer.
- Nerd Fonts installed manually (see the video below) so the terminal theme renders correctly.

## Getting Started

1. Clone this repository and open it in a terminal.
2. Install baseline utilities (optional but recommended):
   ```bash
   cd installers
   ./basic-utils.sh
   ```
3. Install Kitty and apply this configuration:
   ```bash
   cd installers
   ./kitty-install.sh
   ```
   The script will remove any existing `~/.config/kitty` directory before copying these settings, so back up anything you care about.

## Keeping Local Changes

When you tweak your Kitty setup locally, capture those changes into the repo:

```bash
cd save-current-configs
./save-kitty-config.sh
```

This copies `~/.config/kitty` into `configs/kitty/` so you can review and commit the updates.

## Fonts / Nerd Font Reminder

The repo doesn't yet automate Nerd Font installation. I currently follow the steps in this video to download and install them manually: https://www.youtube.com/watch?v=mQdB_kHyZn8&t=77s.
