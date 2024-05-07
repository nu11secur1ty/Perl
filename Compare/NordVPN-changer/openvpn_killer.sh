#!/usr/bin/bash
kill $(pgrep -f openvpn)
# If you use squid
# kill $(pgrep -f squid)
