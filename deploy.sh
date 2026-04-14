#!/bin/bash

set -e

echo "Updating system"
sudo apt update -y

echo "Installing python"
sudo apt install python3-pip -y

echo "Creating project folder"
mkdir -p simple_python_app
cd simple_python_app

echo "Cloning repo"
if [ ! -d ".git" ]; then
  git clone git@github.com:workemail-devops/simple_python_app.git .
else
  git pull origin dev
fi

echo "Installing dependencies"
pip3 install -r requirements.txt

echo "Stopping old app"
pkill -f "python3 app.py" || true

echo "Starting app"
nohup python3 app.py > output.log 2>&1 &
