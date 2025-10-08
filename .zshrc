# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(
  git
  bundler
  dotenv
  macos
  mvn
  rake
  ruby
  rbenv
)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias tar=gtar

# Optimized PATH construction - build it once instead of multiple exports
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:/opt/homebrew/opt/libpq/bin:$HOME/.pyenv/shims:$HOME/.pyenv/bin:$HOME/.bun/bin:/Users/mariakorlotian/Library/pnpm:/opt/homebrew/opt/mysql/bin:$PATH"

# Lazy-load NVM but auto-activate for npm/node commands
export NVM_DIR="$HOME/.nvm"

# Add this helper function (place it before the nvm/npm/node/npx functions)
_load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    export PATH="$(npm config get prefix)/bin:$PATH"
}

# Then your lazy-load functions will work correctly:
nvm() {
    unset -f nvm npm node npx
    _load_nvm
    command nvm "$@"
}

npm() {
    unset -f nvm npm node npx
    _load_nvm
    command npm "$@"
}

node() {
    unset -f nvm npm node npx
    _load_nvm
    command node "$@"
}

npx() {
    unset -f nvm npm node npx
    _load_nvm
    command npx "$@"
}

# Lazy-load rbenv
rbenv() {
    unset -f rbenv
    eval "$(command rbenv init - zsh)"
    rbenv "$@"
}

# Lazy-load pyenv
pyenv() {
    unset -f pyenv
    eval "$(command pyenv init -)"
    pyenv "$@"
}

# Set PYENV_ROOT but don't init until needed
export PYENV_ROOT="$HOME/.pyenv"

# Lazy-load SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
    unset -f sdk
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk "$@"
}

# Lazy-load Google Cloud SDK
gcloud() {
    unset -f gcloud
    if [ -f '/Users/mariakorlotian/Downloads/google-cloud-sdk/path.zsh.inc' ]; then
        . '/Users/mariakorlotian/Downloads/google-cloud-sdk/path.zsh.inc'
    fi
    if [ -f '/Users/mariakorlotian/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then
        . '/Users/mariakorlotian/Downloads/google-cloud-sdk/completion.zsh.inc'
    fi
    gcloud "$@"
}

# Load bun completions only if bun is used
[ -s "/Users/mariakorlotian/.bun/_bun" ] && source "/Users/mariakorlotian/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"

# PNPM setup (kept as-is since it's already optimized)
export PNPM_HOME="/Users/mariakorlotian/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Utility functions (these don't slow startup)
function coditsu() {
    \curl -sSL https://api.coditsu.io/run/local | bash;
}

function rbenv-doctor() {
    \curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash;
}

# Aliases
alias rubocop='$HOME/.rbenv/shims/rubocop'
alias aws="/usr/local/bin/aws"
alias claude="/Users/mariakorlotian/.claude/local/claude"
