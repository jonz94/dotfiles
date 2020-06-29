# vscode & vscode-insiders command aliases

if `hash code 2>/dev/null`; then
  if [ `uname -r | grep -i microsoft` ]; then
    alias c.='code . &'
    alias c,='code . &'
  else
    alias c.='code .'
    alias c,='code .'
  fi
fi

if `hash code-insiders 2>/dev/null`; then
  if [ `uname -r | grep -i microsoft` ]; then
    alias ci.='code-insiders . &'
    alias ci,='code-insiders . &'
  else
    alias ci.='code-insiders .'
    alias ci,='code-insiders .'
  fi

  alias ci='code-insiders'
fi
