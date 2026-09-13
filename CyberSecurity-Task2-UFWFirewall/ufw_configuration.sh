#!/bin/bash
set -e

echo "[+] Resetting UFW..."
sudo ufw --force reset

echo "[+] Setting Default Policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "[+] Adding Task Rules..."
sudo ufw allow 22/tcp comment 'Allow SSH'
sudo ufw deny 80/tcp comment 'Block HTTP'
sudo ufw allow 443/tcp comment 'Allow HTTPS'
sudo ufw deny from 192.168.2.128 comment 'Block Metasploitable VM'

echo "[+] Enabling Firewall..."
sudo ufw --force enable

echo "[+] Verbose Firewall Status:"
sudo ufw status verbose
