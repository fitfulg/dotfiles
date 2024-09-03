# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# export PATH=$PATH:/mnt/c/Users/rc84e/AppData/Roaming/npm
# Path to your Oh My Zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git z sudo history)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom functions
# FN to use cheat.sh
# Example: cheat tar
cheat() {
  curl -m 10 "http://cheat.sh/${1}" 2>/dev/null || printf '%s\n' "[ERROR] Something broke"
}

# FN to detect the path of Windows Terminal's settings.json
# Function to detect the path of Windows Terminal's settings.json
detect_windows_terminal_settings() {
    echo "Detecting Windows Terminal settings.json path..."

    # List directories under /mnt/c/Users/ excluding system directories and files
    export windows_username=$(ls -d /mnt/c/Users/*/ | grep -vE 'Public|Default|Default\ User|All\ Users' | awk -F '/' '{print $(NF-1)}')

    # Ensure only the first valid directory is selected
    windows_username=$(echo "$windows_username" | head -n 1)

    if [ -z "$windows_username" ]; then
        echo "Could not detect Windows username."
        unset MY_SETTINGS
        return
    fi
    
    echo "Detected Windows username: $windows_username"
    
    local search_path="/mnt/c/Users/$windows_username/AppData/Local/Packages/"
    echo "Searching in path: $search_path"
    
    local settings_path
    settings_path=$(find "$search_path" -type f -name "settings.json" -path "*/LocalState/settings.json" 2>/dev/null)

    if [ -n "$settings_path" ]; then
        echo "Windows Terminal settings.json path found: $settings_path"
        export MY_SETTINGS="$settings_path"
    else
        echo "settings.json file not found."
        unset MY_SETTINGS
    fi
}

# Execute the function to detect the path
detect_windows_terminal_settings

# Variables for personal paths
export MY_DESKTOP="/mnt/c/Users/$windows_username/Desktop"
export MY_DOWNLOADS="/mnt/c/Users/$windows_username/Downloads"
export MY_CHROME="/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"
export MY_DEV="/mnt/c/Users/$windows_username/Desktop/DEV"

# Debugging: Print paths to verify
echo "MY_DESKTOP is set to: $MY_DESKTOP"
echo "MY_DOWNLOADS is set to: $MY_DOWNLOADS"
echo "MY_CHROME is set to: $MY_CHROME"
echo "MY_DEV is set to: $MY_DEV"

# Aliases for common actions
alias desktop="cd \"$MY_DESKTOP\""
alias downloads="cd \"$MY_DOWNLOADS\""
alias chrome="\"$MY_CHROME\""
alias dev="cd \"$MY_DEV\""
alias bat="batcat"
alias exp='explorer.exe .'

# Alias for editing Windows Terminal settings
if [ -n "$MY_SETTINGS" ]; then
    alias settings="code \"$MY_SETTINGS\""
else
    alias settings="echo 'Windows Terminal settings.json not found or not set.'"
fi
alias ls='ls --color=auto'

# Update PATH
export PATH=$PATH:/usr/local/bin

# Set colors for ls
export LS_COLORS="di=34:fi=0:ln=36:pi=33:so=35:bd=46;34:cd=43;34:or=31:mi=41:ex=32"

# Load Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git z sudo history)
source $ZSH/oh-my-zsh.sh


