
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
printf '\n%.0s' {1..100}
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:$PATH:$HOME/.config/nvim/lua-language-server/bin/:$HOME/.local/bin:/usr/local/go/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/nsapse/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status virtualenv vi_mode)
typeset -g POWERLEVEL9K_INSTANT_PROMPT_COMMAND_LINES=0

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
    alias-finder
    archlinux
    autopep8
    colorize
	colored-man-pages
    docker
    # docker-compose
	#forgit
    fzf-tab
    git
	gh
    github
    heroku
	kubectl
    lein
    npm
	rust
    pipenv
    pylint
    python
    taskwarrior
    themes
    tmux
    # vi-mode
    zsh-autosuggestions
    zsh-completions
    zsh-interactive-cd
    zsh-syntax-highlighting
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

#bind key to enter vim mode
bindkey -v

# Define an init function and append to zvm_after_init_commands
function my_init() {
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(my_init)

export FZF_DEFAULT_OPTS="--height=95% --layout=reverse  --border --margin=1 --padding=1 --preview 'bat --style numbers,changes --color=always  {}' "
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow  --glob"
#' User configuration

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
alias zc="nvim ~/.zshrc"
alias zso="source ~/.zshrc"
alias nc="nvim ~/.config/nvim/init.vim"
alias ncl="nvim ~/.config/nvim/lua/init.lua"
alias xc="nvim ~/.xinitrc"
alias bc="nvim ~/.config/bspwm/bspwmrc"
alias sxc="nvim ~/.config/sxhkd/sxhkdrc"
alias pbc="nvim ~/.config/polybar/config"
alias tc="nvim ~/.tmux.conf"
alias tso="source ~/.tmux.conf"
alias lgc="nvim ~/.config/jesseduffield/lazygit/config.yml"
alias plc="nvim ~/.p10k.zsh"
alias ic="nvim ~/.config/i3/config"
alias icl="nvim ~/.i3/i3_config_laptop"
alias icd="nvim ~/.config/i3/config"
alias pic="nvim ~/.config/picom.conf"
alias alac="nvim ~/.config/alacritty/alacritty.yml"
alias 10kc="nvim ~/.p10k.zsh"
alias kc="nvim ~/.config/kitty/kitty.conf"
alias ranc="nvim ~/.config/ranger/rc.conf"
alias roc="nvim ~/.config/rofi/config"
alias sc="nvim ~/.config/starship.toml"
alias twc="nvim ~/.taskrc"
alias kmc="nvim ~/.config/kmonad/thinkpad_config.kbd"
alias mc="nvim ~/.config/mutt/muttrc"
alias nm="neomutt"
alias wiki="nvim ~/vimwiki/index.wiki"
alias ww="wiki"
alias zathc="nvim ~/.config/zathura/zathurarc"
alias gc="nvim ~/.gitconfig"

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
alias _325="cd ~/Developer/OSU/CS-325"
alias _340="cd ~/Developer/OSU/CS-340"
alias _361="cd ~/Developer/OSU/CS-361"
alias scions="cd ~/Developer/scion_site/scion-exchange"
alias resume="cd ~/Developer/resume/moderncv"
alias _bash="cd ~/Developer/bash"
alias _react="cd ~/Developer/learn_react"
alias dactyl="cd ~/.dotfiles/qmk/qmk_firmware/keyboards/handwired/dactyl_manuform/5x7/keymaps/loafers_map"

# navigation and history
alias lsa="exa -a -l --icons --color=auto"
alias lst='tree -C'
alias lsp='ls -a -l --color=auto | less'
alias lsg='ls -a -l --color=auto | grep --color=auto'
alias lsgl='ls -a -l --color=auto | grep --color=auto | less '
alias grep="grep --color=auto"
alias greph="history|grep"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias chx="chmod +x"
alias sdi="sudo dnf install"
alias mk="minikube"

zo(){
     zathura $1 & disown
}

cdls(){
    cd $1 && lsa
}

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
alias gaA="git add ."
alias gcom="git commit -m"
alias gcl="git clone"
alias gclb="git clone --bare"
alias gs="git status"
alias gp="git push"
alias lg="lazygit"
alias gr="git remote -v"
alias gcne="git commit --amend -S --no-edit"

gcne-p()
{
	gcne && gp -f	
}
 
alias glp="git log --all --decorate --oneline --graph"

alias gwa="git worktree add"
alias gwl="git worktree list"

#Random Aliases
alias HL="heroku local"
alias code="code-insiders"

#system aliases
alias nct="netctl"

# service aliases
alias sct="systemctl"
alias scts="systemctl start"
alias scte="systemctl enable"
alias smdb="systemctl enable mariadb.service"
alias serve="python -m http.server"

#pacman aliases
alias pacS="sudo pacman -S"
alias pacSyu="sudo pacman -Syu"
alias vp="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias vy="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"

#tmux aliases
alias ta="tmux attach -t"
alias tls="tmux ls"
alias ts="tmux new-session -s"
alias tk="tmux kill-session -t"
alias tm="tmux"

#python aliases
alias py="python"
alias ipy="ipython"

#node aliases
alias nd="node"
alias cra="create-react-app"
alias ffx="firefox"

#fzf stuff
alias FF="fzf"
alias NF='nvim $(fzf)'

#QMK aliases
alias qmj="qmk json2c"

# for Tex
alias tlmgr='TEXMFDIST/scripts/texlive/tlmgr.pl --usermode'
# various command aliases

# Alias Finder
alias af="alias-finder"

#TaskWarrior and TaskWarriorTUI Stuff
alias t="task"
alias tm="task modify"
alias in="task add +in"
#alias job="task add project:jobs"
alias tA="task add "
alias tAn="task annotate"
alias twt="taskwarrior-tui"
alias tt="vit"
alias to="taskopen"
alias mlt="task +LATEST modify"
alias todo="task +next"
alias inbox="task +in"

# remapping system default programs
alias cat="bat -p"
# alias sed="sad"

job(){
    task add project:jobs $1;
    ID=$(task +LATEST ids);
    task $ID annotate $2;
} 

tLC(){
    task add project:leetcode $1;
    ID=$(task +LATEST ids);
    task $ID annotate $2;
}

#tJobT(){
    #task add project:jobs $1;
    #ID=$(task +LATEST ids);
    #task $ID annotate $2;
    #task $ID modify +$3
#} 

tAA(){
    task add $1;
    ID=$(task +LATEST ids);
    task $ID annotate $2;
}

nextt(){
    task add $1 +next;
}

#gcm(){
    #git commit -m $1;
#}

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

## For Kube and Stuff

alias kdc="kind delete cluster"
alias kcc="kind create cluster"
alias kgc="kind get clusters"

krc()
{
	kdc
	kcc
}

olmup () {
    # Create olm-cluster if not already present
    kind get clusters 2>&1 | grep "olm-cluster" --quiet
    if [[ $? -eq 0 ]]; then
        echo "Found olm-cluster was already started"
    else
        echo "Could not find olm-cluster, starting now..."
        kind create cluster --name olm-cluster
    fi

    # Load OLM onto the cluster if it isn't already present
    k api-resources | grep "coreos" --quiet
    if [[ $? -eq 0 ]]; then
        echo "Found olm was already installed"
    else
        ( cd PATH/TO/YOUR/OLM && make run-local )
    fi
}

olmdown () {
    # Delete the olm-cluster if it is defined
    kind get clusters 2>&1 | grep "olm-cluster" --quiet
    if [[ $? -eq 0 ]]; then
        echo "Found olm-cluster, deleting now..."
        kind delete clusters olm-cluster
    else
        echo "Could not find olm-cluster, nothing to delete."
    fi
}

olmrs () {
    olmdown
    olmup
}

# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TMUX Integration Settings

#${ZSH_TMUX_AUTOSTART:=true}   # Autolaunch into TMUX 

# sourcing FZF bindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#source forgit
source ~/.oh-my-zsh/plugins/forgit/forgit.plugin.zsh

# sourcing openshift/kube autocomplete
# source <(oc completion zsh)
source <(kubectl completion zsh)

# Launch Starship
# eval "$(starship init zsh)"

# For JDTLS stuff
# Mandatory:
# .bashrc
export JDTLS_HOME=/usr/bin/jdtls # Directory with the plugin and configs directories

# Optional:
#export JAVA_HOME=/path/to/java_home # In case you don't have java in path or want to use a version in particular
#export WORKSPACE=/path/to/workspace # Defaults to $HOME/workspace

# set the pager to be bat with some sh preprocesing
# export MANPAGER="bat"
# set default pager to be delta
# export GIT_PAGER='delta'

# Start Zoxide
eval "$(zoxide init zsh)"
# export TERM="screen-256color"

alias luamake=/home/nsapse/Downloads/lua-language-server/3rd/luamake/luamake
