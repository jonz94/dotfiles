# flatpak command aliases

if type flatpak &> /dev/null; then
  alias fud='flatpak remote-ls --updates'
  alias fug='sudo flatpak update'
fi
