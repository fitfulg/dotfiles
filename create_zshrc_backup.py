import os
import shutil
import subprocess

def get_windows_username():
    try:
        # Run the command to get the list of directories under /mnt/c/Users/
        result = subprocess.run(
            "ls -d /mnt/c/Users/*/ | grep -vE 'Public|Default|Default\\ User|All\\ Users' | awk -F '/' '{print $(NF-1)}'",
            shell=True,
            capture_output=True,
            text=True,
        )
        # Get the first valid directory name
        windows_username = result.stdout.splitlines()[0] if result.stdout else None
        return windows_username
    except Exception as e:
        print(f"An error occurred while detecting Windows username: {e}")
        return None

# Detect the Windows username
windows_username = get_windows_username()

if not windows_username:
    print("Could not detect Windows username. Exiting.")
else:
    zshrc_path = os.path.expanduser("~/.zshrc")

    repo_dir = f"/mnt/c/Users/{windows_username}/Desktop/DEV/dotfiles/zsh"

    destination_path = os.path.join(repo_dir, "zshrc_backup.zsh")

    try:
        shutil.copy(zshrc_path, destination_path)
        print(f"Contenido de .zshrc copiado exitosamente a {destination_path}")
    except FileNotFoundError:
        print(f"El archivo .zshrc no se encuentra en {zshrc_path}")
    except Exception as e:
        print(f"Ocurrió un error al copiar el archivo: {e}")
