import os
import shutil

def copy_zshrc_backup_to_zshrc():
    home_directory = os.path.expanduser("~")
    zshrc_backup_path = os.path.join(os.getcwd(), "zsh", "zshrc_backup.zsh")
    zshrc_path = os.path.join(home_directory, ".zshrc")
    
    if not os.path.exists(zshrc_backup_path):
        print(f"Backup file not found: {zshrc_backup_path}")
        return
    
    # Copy the backup to ~/.zshrc
    try:
        shutil.copyfile(zshrc_backup_path, zshrc_path)
        print(f"Copied {zshrc_backup_path} to {zshrc_path}")
    except Exception as e:
        print(f"Error copying file: {e}")

if __name__ == "__main__":
    copy_zshrc_backup_to_zshrc()
