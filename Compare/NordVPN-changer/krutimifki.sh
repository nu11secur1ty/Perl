#!/usr/bin/bash
systemctl start squid.service
# Authentication
openvpn --config ge.ovpn --auth-nocache --auth-user-pass auth.txt
	exit 0;
