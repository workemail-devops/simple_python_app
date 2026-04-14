#!/bin/bash

set -e

echo "Updating system"
sudo apt update -y

echo "Installing python"
sudo apt install python3-pip -y

echo "Installing dependencies"
pip3 install -r requirements.txt

echo "Stopping old app"
pkill -f "python3 app.py" || true

echo "Starting app"
nohup python3 app.py > output.log 2>&1 &
