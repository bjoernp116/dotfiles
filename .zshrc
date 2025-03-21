#!/bin/zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit

# Starship Plugin
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# zsh-users plugins: Syntax highlighting, completion
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_save_no_dups

alias ls=eza
alias cat=bat
alias whatis="sleep 5s && hyprctl activewindow"


export PATH=".cargo/bin:$PATH"
export PATH="/home/pollen/.local/bin:$PATH"
export PATH="/home/pollen/.global_npms/node_modules/.bin:$PATH"

export MANPAGER="bat"

export PKG_CONFIG_PATH=""
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}13fw0scdl9ciz5lpabi9nkxwrnn8555g-libglvnd-1.7.0-dev/lib/pkgconfig:"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}$(nix eval --raw nixpkgs#xorg.libX11.dev)/lib/pkgconfig:"


export CPLUS_INCLUDE_PATH=$(nix eval --raw nixpkgs#gcc)/include/c++/13.2.0
export LIBRARY_PATH=$(nix eval --raw nixpkgs#gcc)/lib
export LD_LIBRARY_PATH=$(nix eval --raw nixpkgs#gcc)/lib

#eval "$(zoxide init zsh --cmd j)"

eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

source ~/.config/fzf-git.sh/fzf-git.sh
