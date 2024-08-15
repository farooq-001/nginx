# nginx
# Update package list and install Nginx
sudo apt update
sudo apt install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx
chmod +x setup.sh
./setup.sh

# Check the Nginx Configuration
sudo nginx -t
###print###
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful

# Restart the Nginx Service
sudo systemctl restart nginx

# Port Conflicts
sudo netstat -tuln | grep :80


