# WSL
if [ `uname -r | grep -i microsoft` ]; then
  for file in ${DOTS}/wsl/_*.sh; do
    source ${file}
  done
fi
