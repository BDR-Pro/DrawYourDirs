#!/bin/bash

echo "Setting up drawyourdir..."

# Check if Python is installed
if ! command -v python3 &> /dev/null
then
    echo "Python could not be found, please install it first."
    exit 1
fi

# Check if pip is installed
if ! command -v pip &> /dev/null
then
    echo "pip could not be found, please install it first."
    exit 1
fi

# Install pathspec Python package
pip install pathspec

# Create the target directory if it doesn't already exist
mkdir -p /usr/local/bin/drawyourdir

# Copy the script to the target directory
cp drawyourdir.py /usr/local/bin/drawyourdir

# Make the script executable
chmod +x /usr/local/bin/drawyourdir/drawyourdir.py

# Correctly create a symbolic link for the 'drawyourdir' command in /usr/local/bin
ln -s /usr/local/bin/drawyourdir/drawyourdir.py /usr/local/bin/drawyourdir

echo "alias drawyourdir='python3 /usr/local/bin/drawyourdir/drawyourdir.py'" >> ~/.bashrc

 
echo "drawyourdir is ready to use!"
