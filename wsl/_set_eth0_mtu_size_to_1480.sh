# when using PPPoE(DSL) for network connection on Windows,
# the mtu size is set to 1480 by Windows.
# so we should also set eth0's mtu size to 1480
# this will avoid a lot of network issues

if [[ -z `ip addr | grep "eth0.*mtu 1480 "` ]]; then
  sudo ip link set eth0 mtu 1480
fi
