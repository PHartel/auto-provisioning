#!/bin/bash

ip address add 192.168.100.6/24 broadcast + dev ${NET_IFACE}
ip route add default via 192.168.100.1 dev ${NET_IFACE}
timedatectl