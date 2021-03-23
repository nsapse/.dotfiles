# Setup fzf
# ---------
if [[ ! "$PATH" == */home/noah/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/noah/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/noah/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/noah/.fzf/shell/key-bindings.zsh"
