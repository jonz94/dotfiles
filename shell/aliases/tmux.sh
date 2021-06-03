# tmux command aliases

if type tmux &> /dev/null; then
  alias t='tmux attach 2> /dev/null || tmux new -s home'
  alias ta='tmux attach'
  alias tkall='tmux kill-server'
  alias tks='tmux kill-session'
  alias tls='tmux ls'
  alias tn='tmux new -s home'
fi
