# npm command aliases

if type npm &> /dev/null; then
  alias nid='npm i --save-dev'
  alias nig='npm i -g'
  alias nis='npm i --save'
  alias nls='npm ls --depth 0'
  alias nlsg='npm ls --depth 0 -g'
  alias nlso='npm outdated'

  alias nrm="echo 'please use \`nun\` (https://github.com/antfu-collective/ni?tab=readme-ov-file#nun---uninstall)'"
fi
