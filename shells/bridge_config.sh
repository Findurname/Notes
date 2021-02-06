#!/bin/bash

## Del bridge
sudo ifconfig br0 down
sudo brctl delbr br0

## Add bridge
sudo brctl addbr br0
sudo brctl addif br0 enp0s20f0u1 eno1 
sudo ifconfig br0 192.168.225.210 up

sleep 1s

## Laptop ip setting
sudo ifconfig eno1 192.168.225.222  ## Laptop static ip

## ag35 setting
## ssh ip: 192.168.225.1
## Note: Name "enp0s20f0u1" may be different 
sudo dhclient enp0s20f0u1 -r
sudo dhclient enp0s20f0u1

ifconfig

## sudo /etc/init.d/networking restart
# ifconfig eth0 down
# ifconfig eth0 up
