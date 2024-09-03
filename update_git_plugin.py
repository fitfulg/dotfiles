import os
import shutil
import subprocess

def find_git_plugin_path():
    """Find the path to the git.plugin.zsh file in Oh My Zsh plugins."""
    oh_my_zsh_path = os.path.expanduser("~/.oh-my-zsh")
    plugin_path = os.path.join(oh_my_zsh_path, "plugins/git/git.plugin.zsh")
    if os.path.exists(plugin_path):
        return plugin_path
    else:
        raise FileNotFoundError("git.plugin.zsh not found in Oh My Zsh plugins directory.")

def update_oh_my_zsh():
    """Update Oh My Zsh."""
    try:
        print("Updating Oh My Zsh...")
        subprocess.run(["zsh", "-c", "source ~/.oh-my-zsh/lib/cli.zsh && omz update"], check=True)
        print("Oh My Zsh updated successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to update Oh My Zsh: {e}")
        return False
    return True

def copy_git_plugin(source_path, dest_path):
    """Copy the updated git.plugin.zsh to the dotfiles repository."""
    try:
        print(f"Copying {source_path} to {dest_path}...")
        shutil.copy(source_path, dest_path)
        print("File copied successfully.")
    except IOError as e:
        print(f"Failed to copy file: {e}")
        return False
    return True

def main():
    try:
        git_plugin_path = find_git_plugin_path()
        if update_oh_my_zsh():
            dotfiles_path = os.path.expanduser("~/dotfiles/zsh/git.plugin.zsh")
            copy_git_plugin(git_plugin_path, dotfiles_path)
    except FileNotFoundError as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
