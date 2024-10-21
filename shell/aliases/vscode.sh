# vscode & vscode-insiders command aliases

if type code &> /dev/null; then
  alias c.='code .'
  alias c,='code .'

  alias c..='code ..'
  alias c,,='code ..'
  alias c.,='code ..'
  alias c,.='code ..'
fi

if type code-insiders &> /dev/null; then
  alias ci.='code-insiders .'
  alias ci,='code-insiders .'

  alias ci='code-insiders'
fi
