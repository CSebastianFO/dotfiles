# PATH: programas del usuario
typeset -U path
path=("$HOME/.local/bin" "$HOME/bin" $path)
export PATH
#hola
#
# Historial
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Autocompletado
autoload -Uz compinit
compinit

# Comodidades
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

#Zoxide Config
eval "$(zoxide init zsh)"

# Yazi Config
function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

#Starship Config
eval "$(starship init zsh)"

# Alias
alias ll='ls -lah'
alias c='clear'
alias vim='nvim'
