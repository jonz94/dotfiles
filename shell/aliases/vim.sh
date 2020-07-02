# (neo)vim command aliases

# For me, neovim is the best, vim is better, vi is good.
if type nvim &> /dev/null; then
  alias v='nvim'
  alias vi='nvim'
  alias vim='nvim'
elif type vim &> /dev/null; then
  alias v='vim'
  alias vi='vim'
else
  alias vim='vi'
fi

alias vd='vim $HOME/dotfiles'
alias vz='vim $DOTS/local/local.zsh'
alias vv='vim $DOTS/nvim/jonz94.vim'

# With sudo
alias sv.='sudo vim .'
alias sv,='sudo vim .'
alias sv='sudo vim'

v. () {
  if [ -f Session.vim ]; then
    vim -S Session.vim
  else
    vim .
  fi
}

v, () { v. }

vs () { v. }
