# flatpak command aliases

if `hash flatpa 2>/dev/null`; then
  alias fud='flatpak remote-ls --updates'
  alias fug='sudo flatpak update'
fi
