#Install the EPEL repository

sudo yum -y install epel-release


#installing the EPEL repository.
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -Uvh epel-release-7*.rpm


#Install the IUS repository (optional)

wget http://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/ius-release-1.0-13.ius.centos7.noarch.rpm
sudo rpm -Uvh ius-release*.rpm

#Upgrade installed packages to IUS versions

sudo yum install yum-plugin-replace

sudo yum replace php --replace-with php53


wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm 
sudo rpm -Uvh remi-release-7*.rpm

sudo yum --enablerepo=remi install php-tcpdf
