# flatpak command aliases

if type flatpa &> /dev/null; then
  alias fud='flatpak remote-ls --updates'
  alias fug='sudo flatpak update'
fi
