# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/noah/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status virtualenv vi_mode )
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    autopep8
    cargo
    github
    colorize
    docker
    docker-compose
    git
    lein
    npm
    python
    vi-mode
    zsh-autosuggestions
    zsh-completions
    zsh-interactive-cd
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# access config files
alias .z="nvim ~/.zshrc"
alias zso="source ~/.zshrc"
alias .n="nvim ~/.config/nvim/init.vim"
alias .x="nvim ~/.xinitrc"
alias .b="nvim ~/.config/bspwm/bspwmrc"
alias .sx="nvim ~/.config/sxhkd/sxhkdrc"
alias .pb="nvim ~/.config/polybar/config"
alias .t="nvim ~/.tmux.conf"
alias .lg="nvim ~/.config/jesseduffield/lazygit/config.yml"
alias .pl="nvim ~/.p10k.zsh"
alias .i="nvim ~/.config/i3/config"
alias .pi="nvim ~/.config/picom.conf"
alias .alac="nvim ~/.config/alacritty/alacritty.yml"
alias .nm="nvim ~/.config/neomutt/.neomuttrc"



# aliasing directories
alias cdf='cd ~/.dotfiles'
alias dev="cd ~/Developer"
alias devC="cd ~/Developer/c_programming"
alias conf="cd ~/.config"
alias keebs="cd ~/Developer/keyboards"
alias wallpaper="cd ~/Pictures/wallpapers"
alias osu="cd ~/Developer/OSU"
alias _290="cd ~/Developer/OSU/CS-290"
alias _261="cd ~/Developer/OSU/CS-261"
alias scions="cd ~/Developer/scion_site/scion-exchange"
alias _bash="cd ~/Developer/bash"

# navigation and history
alias lsa="ls -a -l --color=auto"
alias lst='tree -C'
alias lsp='ls -a -l --color=auto | less'
alias lsg='ls -a -l --color=auto | grep --color=auto'
alias lsgl='ls -a -l --color=auto | grep --color=auto | less '
alias grep="grep --color=auto"
alias gh="history|grep"
alias ..="cd .."
alias ...="cd ../.."
alias chx="chmod +x"

mcd(){
    mkdir $1 && cd $1
}

#nvim related aliasing and functions
nt(){
    touch $1 && nvim $1
}

cdl(){
    cd $1 && ls
}

alias nv="nvim"

# git aliases
alias ga="git add "
alias gaa="git add ."
alias gc="git commit -m"
alias gC="git clone"
alias gs="git status"
alias gp="git push"
alias lg="lazygit"

#system aliases
alias nct="netctl"

# service aliases
alias sct="systemctl"
alias scts="systemctl start"
alias scte="systemctl enable"
alias smdb="systemctl enable mariadb.service"

#pacman aliases
alias pacS="sudo pacman -S"
alias pacSyu="sudo pacman -Syu"
alias vp="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias vy="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro sudo yay -S"

#tmux aliases
alias ta="tmux attach -t"
alias tls="tmux ls"
alias ts="tmux new-session -s"
alias tk="tmux kill-session -t"
alias tm="tmux"

#python aliases
alias py="python"

#node aliases
alias nd="node"

#fzf stuff
alias FF="fzf"
alias NF='nvim $(fzf)'

#QMK aliases
alias qmj="qmk json2c"

# various command aliases

# various app aliases
alias nm="neomutt"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   unzstd $1    ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# sourcing FZF bindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
