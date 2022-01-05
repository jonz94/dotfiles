# gpg helpers

gpg-login() {
  export GPG_TTY=$(tty)
  echo 'test' | gpg --clearsign > /dev/null 2>&1
}

gpg-logout() {
  echo RELOADAGENT | gpg-connect-agent
}
