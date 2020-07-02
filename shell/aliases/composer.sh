# composer command aliases

if type composer &> /dev/null; then
  alias cr='composer require'
  alias crd='composer require --dev'
  alias cso='composer show -o'
  alias cup='composer update --with-all-dependencies'
  alias cug='composer global update --with-all-dependencies'
  alias cw='composer why'
fi
