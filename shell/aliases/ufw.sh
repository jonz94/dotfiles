# ufw command aliases

if type ufw &> /dev/null; then
  alias ust='sudo ufw status verbose'
  alias ustn='sudo ufw status numbered'
fi
