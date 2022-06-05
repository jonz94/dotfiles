# gpg helpers

function gpg-login {
  'test' | gpg --clearsign > $null 2>&1
}

function gpg-logout {
  'RELOADAGENT' | gpg-connect-agent
}
