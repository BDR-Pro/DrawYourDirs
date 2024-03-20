#!/bin/bash

echo "Setting up drawyourdir..."

# Check if pip is installed
if ! command -v pip &> /dev/null
then
    echo "pip could not be found, please install it first."
    exit
fi

# Install pathspec Python package
pip install pathspec

# Copy the script to /usr/local/bin
mkdir -p /usr/local/bin/drawyourdir


cp drawyourdir.py /usr/local/bin/drawyourdir

# Make the script executable

chmod +x /usr/local/bin/drawyourdir

# if your write drawyourdir in terminal, it should work



echo "drawyourdir is ready to use!"