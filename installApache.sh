echo "Installing Apache..."
sudo yum install httpd
systemctl enable httpd.service
systemctl start httpd.service
echo '<h1>It Works!</h1>' > /var/www/html/index.html
echo "Apache... is installed "
echo "Please check in browser 127.0.0.1:80"
