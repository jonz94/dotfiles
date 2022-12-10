# zoxide: a smarter cd command

if type zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"

  # TODO: this part can be removed after zoxide release a new version
  # credit: https://github.com/ajeetdsouza/zoxide/pull/474
  # overwrite `__zoxide_cd` function to trigger zsh's `chpwd` hook
  if [ "${_ZO_ECHO}" = "1" ]; then
    function __zoxide_cd() {
      \builtin cd -- "$@" && __zoxide_pwd
    }
  else
    function __zoxide_cd() {
      \builtin cd -- "$@"
    }
  fi
fi
