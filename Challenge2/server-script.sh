#!/bin/bash
sudo apt update
sudo apt install -y nginx-light
sudo systemctl start nginx-light
sudo systemctl enable nginx-light
echo "<h1>Hello from Terraform</h1>" | sudo touch /var/www/html/index.html
