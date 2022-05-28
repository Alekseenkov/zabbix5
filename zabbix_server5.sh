sudo apt update
sudo apt upgrade 
sudo apt install mysql-server -y
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'
sudo ufw allow ssh
sudo ufw allow proto tcp from any to any port 80,443
sudo ufw allow 10050/tcp
sudo ufw enable
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo apt update
sudo apt upgrade
 sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent -y
sudo mysql -uroot -p "create database zabbix character set utf8mb4 collate utf8mb4_bin;"
sudo mysql -uroot -p "create user zabbix@localhost identified by '---------';"
sudo mysql -uroot -p "grant all privileges on zabbix.* to zabbix@localhost"
sudo mysql -uroot -p "quit"
sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
sudo cat /home/user/zabbix_server.conf > /etc/zabbix/zabbix_server.conf
sudo cat  /home/user/nginx.conf > /etc/zabbix/nginx.conf
sudo cat /home/user/php-fpm.conf > /etc/zabbix/php-fpm.conf

systemctl restart zabbix-server zabbix-agent nginx php7.4-fpm
systemctl enable zabbix-server zabbix-agent nginx php7.4-fpm


