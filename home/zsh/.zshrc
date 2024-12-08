# zmodload zsh/zprof 

# export TERM="alacritty"
# export TERM="xterm-256color"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# export MANPAGER='nvim +Man!'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c" #NOTE: may be neede fpr bat formatting purposes
export EDITOR="nvim"
# export VISUAL="nvim"

export SCRSDIR="$HOME/.dotfiles/scripts/"
export GITDIR="$HOME/Git"

export DIFFPROG="nvim -d $1"

# [[ "$(cat /proc/$PPID/comm)" =~ "(kitty|urxvt|xterm|alacritty)" ]] && macchina
# fastfetch 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt autocd interactive_comments menu_complete extendedglob notify

autoload -Uz promptinit compinit
compinit
promptinit


zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _approximate
# zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true
# zstyle :compinstall filename "$HOME/.zshrc"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

for script ($HOME/.zsh/scripts/*.zsh) source $script

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

# From showkey -a
# see commands at https://zsh.sourceforge.io/Guide/zshguide04.html
# zsh docs https://wiki.zshell.dev/docs/guides/syntax/bindkey
bindkey  "^[[3~"  delete-char
bindkey '^[[Z' reverse-menu-complete
# bindkey '^?' backward-delete-char
# bindkey '^[[A' up-line-or-history
# bindkey '^[[B' down-line-or-history

function vmc() {
  local player="$1"
  local volume="$2"
  firstPlayerSinkIndex="$(pactl list sink-inputs | awk '/index:|application.name |application.process.binary / {print $0};' | grep -iB 1 "$player" | awk '/index:/ {print $2; exit}')"  # get specific app sink
  [[ $firstPlayerSinkIndex ]] && pactl set-sink-input-volume "$firstPlayerSinkIndex" "$((volume*65536/100))" # 100% → 65536
}


alias bathelp='bat --plain --language=help'
function help() {
    "$@" --help 2>&1 | bathelp
}
# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias %=' '
alias cd='z'

alias avenv='source .venv/bin/activate'
alias viewhyprlog='bat $XDG_RUNTIME_DIR/hypr/$(ls -t $XDG_RUNTIME_DIR/hypr/ | head -n 1)/hyprland.log'
alias whitesur='~/.dotfiles/scripts/whitesur.sh'
alias gdmh='~/.dotfiles/scripts/greetd_gdm.sh'

alias parur="paru --review"

alias nnvim="nvim --listen /tmp/nvim.pipe"
alias gnvim="nvim --listen /tmp/godot.pipe"
alias linvim="nvim --listen"

alias squirrel="~/ProgramFiles/squirrel-disk.AppImage"
alias notesium="~/Git/notesium//notesium"
alias orcas="~/ProgramFiles/OrcaSlicer_Linux_V1.8.1.AppImage"
alias godotm="~/ProgramFiles/GodotManager/GodotManager.x86_64"

alias drmemory='~/TarGZ/DrMemory-Linux-2.6.0/bin64/drmemory'
alias drmemory32='~/TarGZ/DrMemory-Linux-2.6.0/bin/drmemory'
alias valgrinde='valgrind -s --leak-check=full --show-leak-kinds=all --track-origins=yes'

# alias trone='ssh sshtron.zachlatta.com'

alias ip='ip --color=auto'
alias diff='diff --color=auto'

alias ea='eza -laxF --icons --git --time-style="+%Y-%m-%d %H:%M"'
ewa(){
    eza -laax -F=always --icons=always --git --color=always --time-style="+%Y-%m-%d %H:%M" $1 | head -n 2
}
# alias ewa='eza -laaxF --icons --git --time-style="+%Y-%m-%d %H:%M"'
alias eas='ea -s type'
alias ead='ea --group-directories-first -s type'
# alias ead='ea -D -s type --show-symlinks && ea -f -s type --show-symlinks'

alias lso='ls --color --time-style=long-iso'
alias lsa='lso -la | rg "^d" && lso -la | rg "^-" && lso -la | rg "^l"'
alias lst='lso -lat'
alias lsat='lso -lat | rg "^d" && lso -la | rg "^-" && lso -la | rg "^l"'

alias freehlock=~/.dotfiles/scripts/hyprland/death_screen.sh
alias freepacmanlock='sudo rm -rf /var/lib/pacman/db.lck'
# alias sudo='doas'
# alias las='xplr'
# alias ckupd="checkupdates"
# alias cklupd='ckupd | rip "linux" >> /dev/null && echo -e "\033[35mLinux Kernel update" || echo -e "No Linux kernel update\033[0m"'
# alias ckgupd='ckupd | rip "gnome" >> /dev/null && echo -e "\033[35mGnome update" || echo -e "No Gnome update\033[0m"'
# alias gupd=$SCRSDIR/git_rep_updater.sh
#
alias ncdu='ncdu -e'
# alias duf='duf -all -warnings'
alias dufi='duf -only local'

alias echo='echo -e'

alias rip='rg -i'
alias grep='grep --color=auto'

alias lg='lazygit'

alias cbuild='cmake -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Release -H./ -B./build -G 'Unix Makefiles' && cmake --build ./build --config Release --target all'
alias rpc='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rns $(pacman -Qdtq) || echo "\033[0;35m\nNo orphans to remove\n"'

alias rpcb='lsof +L1'
alias wttr='curl wttr.in'

# LaTex
export MANPATH="$MANPATH:$HOME/ProgramFiles/LaTeX/texlive/2024/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:$HOME/ProgramFiles/LaTeX/texlive/2024/texmf-dist/doc/info"
export PATH="$PATH:$HOME/ProgramFiles/LaTeX/texlive/2024/bin/x86_64-linux"

export JAVA_HOME=/usr/lib/jvm/default/
export PATH="$PATH:$HOME/Git/zig/build/stage3/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/coursier/bin"
export PATH="$PATH:$HOME/.cargo/bin/"

eval "$(zoxide init zsh)"

# FNM - Fast Node Manager
# NOTE: do not forget to run fnm default system after this 
# eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
eval "$(fnm env --use-on-cd)"

# NVM
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zprof
