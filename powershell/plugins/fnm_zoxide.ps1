# fnm & zoxide

# load fnm
if ( $(scoop which fnm) ) {
  fnm env --use-on-cd | Out-String | Invoke-Expression
}

# load zoxide
if ( $(scoop which zoxide) ) {
  # integrate with fnm's `use-on-cd` feature
  if ( $(scoop which fnm) ) {
    Invoke-Expression (& { (zoxide init --hook 'prompt' --no-cmd powershell) -join "`n" })

    function z {
      if ($args.length -lt 1) {
        __zoxide_z
      } else {
        __zoxide_z $args[0]
      }

      Set-FnmOnLoad
    }

    function zi {
      if ($args.length -lt 1) {
        __zoxide_zi
      } else {
        __zoxide_zi @args
      }

      Set-FnmOnLoad
    }
  } else {
    Invoke-Expression (& { (zoxide init --hook 'prompt' powershell) -join "`n" })
  }
}

