# Add qmk related binary to PATH

if [ -d /usr/local/opt/avr-gcc@8/bin ]; then
  export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
fi

if [ -d /usr/local/opt/arm-gcc-bin@8/bin ]; then
  export PATH="/usr/local/opt/arm-gcc-bin@8/bin:$PATH"
fi
