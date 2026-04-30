#!/bin/bash

echo "----- Linux Server Setup Project -----"

# Username input
read -p "Enter username: " username

# Create user
sudo useradd -m $username
echo "User $username created"

# Set password
echo "Set password for $username"
sudo passwd $username

# Create project directory
project_dir="/home/$username/project"
sudo mkdir -p $project_dir
echo "Project folder created at $project_dir"

# Change ownership
sudo chown $username:$username$project_dir

# Set permissions
sudo chmod 700 $project_dir
echo "Permissions set"

# Install Nginx
echo "Installing Nginx..."
sudo apt update -y
sudo apt install nginx -y

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx status:"
sudo systemctl status nginx --no-pager

# create sample HTML page
echo <h1>Welcome $username</h1> | sudo tee /var/www/html/index.html

# Check Disk Usage
echo ""
echo "Disk Usage"
df -h

# Check Memory
echo ""
echo "Internet Check:"
ping -c 2 google.com

# Get IP addresss:"
echo ""
echo "IP Address:"
hostname  -I

echo ""
echo "----- Project Completed -----"
