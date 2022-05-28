sudo apt update
sudo apt upgrade 
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo apt update
sudo apt upgrade
sudo apt install zabbix-agent zabbix-sender
sudo cat /home/user/zabbix_agentd.conf > /etc/zabbix/zabbix_agentd.conf
sudo systemctl start zabbix-agent 
sudo systemctl enable zabbix-agent
systemctl status zabbix-agent
sudo ufw allow 10050/tcp
sudo systemctl restart zabbix-agent