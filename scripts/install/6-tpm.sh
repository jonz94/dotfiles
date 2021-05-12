echo 'installing TPM...'

if [ -d ~/.tmux/plugins/tpm ]; then
  echo 'TPM has been installed, skip installation.'
  exit 0
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'TPM is ready!'
