sudo apt update
sudo apt upgrade 
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo apt update
sudo apt upgrade
sudo apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-nginx-conf zabbix-sql-scripts zabbix-agent
sudo apt-cache policy zabbix-server-pgsql
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update 
sudo apt install postgresql-14 -y
echo "Enter password /etc/zabbix/zabbix_server.conf>"
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix -E Unicode -T template0 zabbix

zcat /usr/share/doc/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
sudo cat /home/""user""/zabbix_server.conf > /etc/zabbix/zabbix_server.conf
 
sudo rm /etc/zabbix/nginx.conf
sudo cp  /home/""user""/nginx.conf /etc/zabbix/

sudo fuser -k 80/tcp
sudo fuser -k 443/tcp
sudo service nginx restart

sudo systemctl restart zabbix-server zabbix-agent nginx php7.4-fpm
sudo systemctl enable zabbix-server zabbix-agent nginx php7.4-fpm
