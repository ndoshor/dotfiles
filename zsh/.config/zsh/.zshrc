# ---------- History ----------
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# ---------- Behavior ----------
setopt AUTO_CD INTERACTIVE_COMMENTS
bindkey -e   # must come before fzf

# ---------- Completion ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Optional: fzf-tab (after compinit, before other plugins)
[ -f /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh ] && \
  source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

# ---------- History search on Up/Down ----------
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ---------- fzf ----------
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :200 {}'"
export FZF_ALT_C_OPTS="--preview 'ls -la {}'"

# ---------- Aliases ----------
alias ll='ls -l'
alias ..='cd ..'

# ---------- Prompt ----------
command -v starship >/dev/null && eval "$(starship init zsh)"

# ---------- Plugins (syntax-highlighting must be last) ----------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"
