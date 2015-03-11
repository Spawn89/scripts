sudo yum update -y 
sudo yum upgrade
sudo yum groupinstall -y "Base Core"
sudo yum groupinstall -y "Web Server" 

sh addExtendedRepocitories.sh
sudo yum install -y net-tools mc wget fail2ban mc nano httpd mod_ssl


systemctl stop firewalld && systemctl disable firewalld

systemctl enable httpd.service
systemctl start httpd.service
echo '<h1>It Works!</h1>' > /var/www/html/index.html

echo "Installing PHP..."
yum -y install php php-common php-gd php-xml php-mbstring
systemctl restart httpd.service
echo '<?php phpinfo(); ?>' > /var/www/html/inf.php


echo "Installing MySQL..."
mySQLpassword="PetR00t"

yum -y install mysql mysql-server
systemctl enable mysqld
systemctl start mysqld
mysqladmin -u root password $mySQLpassword
mysql_secure_installation
yum -y install php-mysql


site="site1.ru"
echo "Create project "+$site
mkdir /home/$site/

mkdir /home/$site/www/
mkdir /home/$site/logs/
mkdir /home/$site/tmp/



systemctl restart httpd

echo "installed php my admin"
sh installPHPMyAdmin.sh
