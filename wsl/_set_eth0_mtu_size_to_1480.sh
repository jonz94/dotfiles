# when using PPPoE(DSL) for network connection on Windows,
# the mtu size is set to 1480 by Windows.
# so we should also set eth0's mtu size to 1480
# this will avoid a lot of network issues

# we can add following two lines to sudoers file of WSL
# this will allow us to execute `sudo ip link set eth0 mtu 1480` without password
# Note: strongly recommend to use command `sudo visudo` for editing sudoers file

# #Allow members of group sudo to execute this command without password
# %sudo ALL=(root) NOPASSWD: /usr/sbin/ip link set eth0 mtu 1480

if [[ -z `ip addr | grep "eth0.*mtu 1480 "` ]]; then
  sudo /usr/sbin/ip link set eth0 mtu 1480
fi
