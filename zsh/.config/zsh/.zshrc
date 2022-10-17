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

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

for script ($ZDOTDIR/scripts/*.zsh) source $script
# source ~/Git/zsh-autocomplete/zsh-autocomplete.plugin.zsh

fpath=($HOME/Git/zsh-completions/src $fpath)

bindkey  "^[[3~"  delete-char

alias sudo='doas'
alias las='xplr'
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
alias build='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G 'Unix Makefiles' && cmake --build ./build --config Release --target all'
alias rpc='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rns $(pacman -Qdtq) || echo "\033[0;35m\nNo orphans to remove\n"'

# macchina
# wal -R

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
