# export TERM="alacritty"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zsh/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

export MANPAGER='nvim +Man!'
export EDITOR="nvim"
# export VISUAL="nvim"

export SCRSDIR="$HOME/.scripts"
export GITDIR="$HOME/Git"

export DIFFPROG="nvim -d $1"

# wal -R
[[ "$(cat /proc/$PPID/comm)" =~ "(kitty|urxvt|xterm|alacritty)" ]] && macchina

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt autocd
setopt interactive_comments
setopt MENU_COMPLETE

autoload -Uz promptinit compinit
compinit
promptinit

eval "$(zoxide init zsh)"

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true

# prompt oliver

source $ZDOTDIR/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $ZDOTDIR/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

for script ($ZDOTDIR/.zsh/scripts/*.zsh) source $script

fpath=($HOME/Git/zsh-completions/src $fpath)


# fzf bindings and completions
#export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden --no-ignore'
export FZF_DEFAULT_COMMAND='fd --color=never --hidden --no-ignore'
export FZF_DEFAULT_OPTS='--height 60% --reverse --border --border-label='
# export FZF_DEFAULT_OPTS='--no-height'
export FZF_DEFAULT_BINDS="--bind ctrl-d:preview-page-down,ctrl-u:preview-page-up,ctrl-f:preview-down,ctrl-b:preview-up
    --bind 'ctrl-/:toggle-preview'
    --bind 'ctrl-\\:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
    --reverse
    --color header:italic
    --header 'Select command to insert'"

export FZF_CTRL_T_COMMAND="fd --type f --color=never --hidden --no-ignore"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'
    $FZF_DEFAULT_BINDS
    --color header:italic
    --header 'Get file path'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden --no-ignore'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'
    $FZF_DEFAULT_BINDS
    --color header:italic
    --header 'CD into directory'"


bindkey  "^[[3~"  delete-char
bindkey '^[[Z' reverse-menu-complete

alias parur="paru --review"

alias nnvim="nvim --listen /tmp/nvim.pipe"
alias gnvim="nvim --listen /tmp/godot.pipe"
alias linvim="nvim --listen"

alias notesium="~/Git/notesium//notesium"
alias orcas="~/ProgramFiles/OrcaSlicer_Linux_V1.8.1.AppImage"
alias godotm="~/ProgramFiles/GodotManager/GodotManager.x86_64"
alias drmemory='~/TarGZ/DrMemory-Linux-2.6.0/bin64/drmemory'
alias drmemory32='~/TarGZ/DrMemory-Linux-2.6.0/bin/drmemory'
alias valgrinde='valgrind -s --leak-check=full --show-leak-kinds=all --track-origins=yes'

alias trone='ssh sshtron.zachlatta.com'

alias lso='ls --color --time-style=long-iso'
alias lsa='lso -la | rg "^d" && lso -la | rg "^-" && lso -la | rg "^l"'
alias lst='lso -lat'
alias lsat='lso -lat | rg "^d" && lso -la | rg "^-" && lso -la | rg "^l"'

alias freepacmanlock='sudo rm -rf /var/lib/pacman/db.lck'
# alias sudo='doas'
alias las='xplr'
alias ckupd="checkupdates"
alias cklupd='ckupd | rip "linux" >> /dev/null && echo -e "\033[35mLinux Kernel update" || echo -e "No Linux kernel update\033[0m"'
alias ckgupd='ckupd | rip "gnome" >> /dev/null && echo -e "\033[35mGnome update" || echo -e "No Gnome update\033[0m"'
alias gupd=$SCRSDIR/git_rep_updater.sh
# alias ncdu='ncdu -e --color off'
alias ncdu='ncdu -e'
alias duf='duf -all -warnings'
alias dufi='sudo duf -warnings -hide loops'
alias echo='echo -e'
alias rip='rg -ie'
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'
alias grep='grep --color=auto'
alias lg='lazygit'
alias p='bpython'
alias cbuild='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G 'Unix Makefiles' && cmake --build ./build --config Release --target all'
alias rpc='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rns $(pacman -Qdtq) || echo "\033[0;35m\nNo orphans to remove\n"'
alias rpcb='lsof +L1'
alias wttr='curl wttr.in'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# LaTex
export MANPATH="$MANPATH:$HOME/ProgramFiles/LaTeX/texlive/2024/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:$HOME/ProgramFiles/LaTeX/texlive/2024/texmf-dist/doc/info"
export PATH="$PATH:$HOME/ProgramFiles/LaTeX/texlive/2024/bin/x86_64-linux"

export PATH="$PATH:$HOME/Git/zig/build/stage3/bin"
export PATH="$PATH:$HOME/.local/bin"
export JAVA_HOME=/usr/lib/jvm/default/
export PATH="$PATH:$HOME/.local/share/coursier/bin"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/powerlevel10k/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
