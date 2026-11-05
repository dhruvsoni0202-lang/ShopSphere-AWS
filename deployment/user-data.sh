#!/bin/bash

# Update system
dnf update -y

# Install Nginx and EFS utilities
dnf install -y nginx amazon-efs-utils

# Start Nginx
systemctl enable nginx
systemctl start nginx

# Configure Nginx on port 8000
cat > /etc/nginx/conf.d/shopsphere.conf <<'EOF'
server {
    listen 8000;
    server_name _;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
EOF

# Create ShopSphere website
cat > /usr/share/nginx/html/index.html <<'EOF'
<h1>Welcome to ShopSphere!</h1>
<p>Highly Available E-Commerce Website powered by AWS.</p>
EOF

# Create EFS mount directory
mkdir -p /mnt/efs

# Mount shared EFS storage
mount -t efs -o tls fs-0a73f02bc36adb6e6:/ /mnt/efs

# Enable Nginx configuration
nginx -t && systemctl restart nginx
