#!/bin/bash

set -e

echo "Updating system"
sudo apt update -y

echo "Installing python venv"
sudo apt install python3-venv -y

echo "Creating virtual environment"
python3 -m venv venv

echo "Activating venv"
source venv/bin/activate

echo "Installing dependencies"
pip3 install -r requirements.txt

echo "Stopping old app"
pkill -f "python3 app.py" || true

echo "Starting app"
nohup python3 app.py > output.log 2>&1 &
