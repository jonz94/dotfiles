# First include shell environment
source ${HOME}/dotfiles/shell/environment.sh

# zplug
if [ -f ~/.zplug/init.zsh ]; then
  source ~/.zplug/init.zsh

  # custom shell variables
  zplug "${DOTS}/shell/variables", use:'*.sh', from:local

  # powerlevel10k theme
  zplug 'romkatv/powerlevel10k', use:powerlevel10k.zsh-theme

  zplug 'zsh-users/zsh-autosuggestions'
  zplug 'zsh-users/zsh-syntax-highlighting'

  # from oh-my-zsh
  zplug 'lib/completion', from:oh-my-zsh
  zplug 'lib/directories', from:oh-my-zsh
  zplug 'lib/grep', from:oh-my-zsh
  zplug 'lib/key-bindings', from:oh-my-zsh
  zplug 'lib/theme-and-appearance', from:oh-my-zsh
  zplug 'plugins/docker', from:oh-my-zsh, if:'(( $+commands[docker] ))'
  zplug 'plugins/docker-compose', from:oh-my-zsh, if:'(( $+commands[docker-compose] ))'
  zplug 'plugins/git', from:oh-my-zsh

  # zplug self management
  zplug 'zplug/zplug', hook-build:'zplug --self-manage'

  # custom plugins
  zplug "${DOTS}/zsh/plugins", from:local

  # local zshrc
  zplug "${DOTS}/local", use:'local.zsh', from:local, if:"[ -f ${DOTS}/local/local.zsh ]", defer:1

  # local theming
  zplug "${DOTS}/local", use:'theme.zsh', from:local, if:"[ -f ${DOTS}/local/theme.zsh ]", defer:1

  # custom shell aliases
  zplug "${DOTS}/shell/aliases", use:'*.sh', from:local, defer:2

  # scripts
  zplug "${DOTS}/scripts", use:"bin/*", as:command, from:local, defer:2

  # Install plugins if there are plugins that have not been installed
  if ! zplug check; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# WSL
if [ `uname -r | grep -i microsoft` ]; then
  for file in ${DOTS}/wsl/_*.sh; do
    source ${file}
  done
fi

# enable wildcard matching
unsetopt no_match
