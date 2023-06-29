# wal -R
macchina

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

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true

prompt oliver

source $ZDOTDIR/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

for script ($ZDOTDIR/.zsh/scripts/*.zsh) source $script

fpath=($HOME/Git/zsh-completions/src $fpath)


# fzf bindings and completions
#export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey  "^[[3~"  delete-char

alias freepacmanlock='sudo rm -rf /var/lib/pacman/db.lck'
alias sudo='doas'
alias las='xplr'
alias pconf="p10k configure"
alias ckupd="checkupdates"
alias cklupd='ckupd | rip "linux" >> /dev/null && echo -e "\033[35mLinux Kernel update" || echo -e "No Linux kernel update\033[0m"'
alias ckgupd='ckupd | rip "gnome" >> /dev/null && echo -e "\033[35mGnome update" || echo -e "No Gnome update\033[0m"'
alias ls='ls --color'
alias gupd=$SCRSDIR/git_rep_updater.sh
alias ncdu='ncdu -e --color off'
alias duf='duf -all -warnings'
alias dufi='sudo duf -warnings -hide loops'
alias echo='echo -e'
alias rip='rg -ie'
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'
alias weat='curl wttr.in'
alias grep='grep --color=auto'
alias lg='lazygit'
alias p='bpython'
alias cbuild='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G 'Unix Makefiles' && cmake --build ./build --config Release --target all'
alias rpc='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rns $(pacman -Qdtq) || echo "\033[0;35m\nNo orphans to remove\n"'
alias rpcb='lsof +L1'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:$HOME/.local/bin"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
