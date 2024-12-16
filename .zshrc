# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----- Homebrew ------
export PATH="/usr/local/sbin:$PATH"
# direnv
eval "$(direnv hook zsh)"
# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# powerlevel10k
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
# bison
export PATH="/usr/local/opt/bison/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/bison/lib"

# ----- Node.js ------
export PATH=`npm prefix --location=global`/bin:$PATH
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# ----- PHP ------
# composer
export PATH=~/.composer/vendor/bin:$PATH

# ----- Python ------
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# poetry
export PATH="/Users/kazuki/.local/bin:$PATH"

# ----- GO -----
export PATH="$HOME/go/bin:$PATH"

# ----- エイリアス ------
source ~/.aliases

# ----- zsh -----
# completion
fpath+=~/.zfunc
autoload -Uz compinit && compinit
# 重複したPATHを削除する
typeset -U PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
