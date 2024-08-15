#!/bin/bash

# Define variables
IP_ADDRESS="34.201.148.88"
PORT1="9001"
PORT2="9002"
PORT3="9003"

# Create Nginx configuration files
cat <<EOF | sudo tee /etc/nginx/sites-available/babafarooq-1.net
server {
    listen 80;
    server_name babafarooq-1.net;

    location / {
        proxy_pass http://$IP_ADDRESS:$PORT1;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

cat <<EOF | sudo tee /etc/nginx/sites-available/babafarooq-2.net
server {
    listen 80;
    server_name babafarooq-2.net;

    location / {
        proxy_pass http://$IP_ADDRESS:$PORT2;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

cat <<EOF | sudo tee /etc/nginx/sites-available/babafarooq-3.net
server {
    listen 80;
    server_name babafarooq-3.net;

    location / {
        proxy_pass http://$IP_ADDRESS:$PORT3;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

# Create symbolic links in sites-enabled
sudo ln -s /etc/nginx/sites-available/babafarooq-1.net /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/babafarooq-2.net /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/babafarooq-3.net /etc/nginx/sites-enabled/

# Test the Nginx configuration
sudo nginx -t

# Restart Nginx to apply changes
sudo systemctl restart nginx

echo "Nginx configuration has been set up and restarted."
