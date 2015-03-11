#!/bin/bash
sudo firewall-cmd --permanent --zone=public --add-service=http 
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
semanage port -a -t http_port_t -p tcp 80
semanage port -a -t http_port_t -p tcp 8080

sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8443/tcp --permanent
semanage port -a -t http_port_t -p tcp 443
semanage port -a -t http_port_t -p tcp 8443

SSH_STANDART_PORT=22
HTTP_STANDART_PORT=80
HTTP_STANDART_PROXY_PORT=8080
HTTPS_STANDART_PORT=443
SMTP_STANDART_PORT=25


for port in  
	$SSH_STANDART_PORT 
	$HTTP_STANDART_PORT
	$HTTPS_STANDART_PORT 
	#$SMTP_STANDART_PORT
	$HTTP_STANDART_PROXY_PORT
do
sudo iptables -I INPUT -p tcp --dport $port -m state --state NEW -j ACCEPT
done

#sudo iptables -I INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
#sudo iptables -I INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT

sudo service iptables save
sudo firewall-cmd --reload
