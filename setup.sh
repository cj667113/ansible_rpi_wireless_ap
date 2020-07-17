#!/bin/sh
sudo cp wpa_ap.conf /etc/wpa_supplicant/wpa_supplicant.conf
sudo wpa_cli -i wlan0 reconfigure
sudo ifconfig wlan0 192.168.0.1/24
sudo mkdir /var/run/dhcp
sudo touch /var/lib/dhcp/dhcpcd.leases
#sudo /usr/sbin/dhcpd -f -user dhcp -group dhcp wlan0
sudo echo 'INTERFACESv4=wlan0' > /etc/default/isc-dhcp-server
sudo systemctl restart isc-dhcp-server
