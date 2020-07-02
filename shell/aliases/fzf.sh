# fzf command aliases

if type fzf &> /dev/null; then
  # select a file by fzf, and then open it by vim
  vf () {
    local file
    file="$(fzf)" && vim "${file}" || return 1
  }
fi
