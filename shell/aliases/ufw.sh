# ufw command aliases

if `hash ufw 2>/dev/null`; then
  alias ust='sudo ufw status verbose'
  alias ustn='sudo ufw status numbered'
fi
