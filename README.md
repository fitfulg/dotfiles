# Dotfiles Repository

This repository contains custom configurations for my development environment, specifically designed for use with **Ubuntu** in **Windows Subsystem for Linux (WSL)**.

## Repository Structure

### Configuration Files
- **`/zsh/zshrc_backup.zsh`**: Zsh personal configuration file. You should run `backup_to_zshrc.py` to update your `~/.zshrc` with its contents or manually copypaste its contents to the `zshrc` file.
- **`WindowsTerminal/settings.json`**: Configuration file for the Windows Terminal.
- **`zsh/git.plugin.zsh`**: Configuration file for the Git plugin in Oh My Zsh. It contains the updated configuration according to the current Zsh version. (just a nice big zsh cheatsheet)

### Scripts
- **`docker_dev_env.py`**: Python script that pulls and runs a Docker image (`ercardona/my-dev-environment`) to set up a development environment in Windows WSL. This environment includes Ubuntu, Oh-My-Zsh, and several configurations, apps, and plugins.
- **`backup_to_zshrc.py`**: Python script that copies the content of `zshrc_backup.zsh` to `~/.zshrc`, allowing you to apply those settings by running `source ~/.zshrc`.
- **`AutoHotkey/ToggleWindowsTerminal.ahk`**: AutoHotkey script that toggles the visibility of the Windows Terminal window using a hotkey (example: Ctrl+Alt+S).
- **`update_git_plugin.py`**: Python script that updates the `git.plugin.zsh` file from Oh My Zsh. (You can ignore it).
- **`create_zshrc_backup.py`**: Python script that copies the content of the `~/.zshrc` file to the repository as `zshrc_backup.zsh` to share the configuration. (You can ignore it).


## How to Use

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your_username/dotfiles.git
    cd dotfiles
    ```

2. **Run Docker Dev Environment**:
    Use `docker_dev_env.py` to set up your development environment.

    ```bash
    python3 docker_dev_env.py
    ```

3. **Apply Zsh Backup Configuration**:
    Make sure Zsh was installed in the previous step, if not install it manually.
    Then run `backup_to_zshrc.py` to copy the content of `zshrc_backup.zsh` to your `~/.zshrc` file, then source it to apply the settings.

    ```bash
    python3 backup_to_zshrc.py
    source ~/.zshrc
    ```

4. **Update Git Plugin**:
    Run `update_git_plugin.py` to fetch the latest `git.plugin.zsh` from Oh My Zsh.

    ```bash
    python3 update_git_plugin.py
    ```

5. **Toggle Windows Terminal**:
    To use the `ToggleWindowsTerminal.ahk` script, you need **AutoHotkey** installed on your Windows system. Here's how to quickly install it from your Ubuntu WSL console:

    ```bash
    # Download and install:
    curl -L -o AutoHotkeySetup.exe https://www.autohotkey.com/download/ahk-install.exe
    cmd.exe /c AutoHotkeySetup.exe /S
    ```

    After installing AutoHotkey, run the `ToggleWindowsTerminal.ahk` script to toggle the visibility of the Windows Terminal with a hotkey (for example: Ctrl+Alt+S).

