if [[ -z "$LC_ALL" ]]; then
  export LC_ALL='en_US.UTF-8'
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="typewritten"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
	vi-mode
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

# Go
export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOBIN:$GOPATH/bin

# Yarn
export YARNBIN=$HOME/.yarn/bin
export PATH=$PATH:$YARNBIN

# Java
#export JAVA_HOME=/usr/local/java/jdk1.8.0_261
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-14.0.2.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_AVD_HOME=$HOME/.android/avd
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin:$ANDROID_HOME/platform-tools

# Pip
export PIPBIN=$HOME/.local/bin
export PATH=$PATH:$PIPBIN

# vim-related stuff
export PATH=$PATH:$HOME/workspace/so-fancy/diff-so-fancy
alias vimdiff='nvim -d'

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

export BAT_THEME="TwoDark"

export PATH=$PATH:/usr/local/homebrew/bin

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/homebrew/opt/nvm/nvm.sh" ] && . "/usr/local/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Python
## alias python=/usr/local/homebrew/bin/python3
## alias pip=/usr/local/bin/pip3

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#export PATH=$PATH:$HOME/Library/Python/3.7/bin

# Antlr
export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

# Beam
export LDFLAGS="-L/usr/local/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/homebrew/opt/openssl@1.1/include"

# LLVM dev
export PATH="$HOME/workspace/hasyimibhar/arcanist/bin:$PATH"
export PATH"=$HOME/workspace/llvm/llvm-project/clang/tools/clang-format:$PATH"

# Enable vi mode
bindkey -v

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hasyimibahrudin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hasyimibahrudin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hasyimibahrudin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hasyimibahrudin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
