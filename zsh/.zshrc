# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/share/Powerlevel10k/Powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# convenience aliases
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"
alias c="clear"
alias e="exit"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- zoxide (better cd) ----
if [ -z "$DISABLE_ZOXIDE" ]; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# ---- eza (better ls) ----
alias ls="eza --all --icons=always"

# ---- bat (better cat) ----
alias cat="bat"

# load machine specific variables
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# git helpers
alias gspp="git stash && git pull && git stash pop"
ghr() {
  gh repo view $GITHUB_OWNER/$1 --web
}
ghs() {
  gh search code $1 --owner=$GITHUB_OWNER --web
}
alias repush="git commit --amend --no-edit && git push origin HEAD --force-with-lease"

# nvm setup
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias tmc="cat ~/repos/dotfiles/tmux/tmux-cheatsheet.md"
# export PATH="$HOME/go/bin:$PATH"
