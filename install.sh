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

# Create the target directory if it doesn't already exist
mkdir -p /usr/local/bin/drawyourdir

# Copy the script to the target directory
cp drawyourdir.py /usr/local/bin/drawyourdir

# IMPORTANT: Change made here. Instead of making the directory executable,
# you should create a symbolic link to the script in the /usr/local/bin directory.
# This way, the script can be executed directly from the terminal using the command name.

# Remove the line chmod +x /usr/local/bin/drawyourdir
# Add the following line to create a symbolic link

ln -s /usr/local/bin/drawyourdir/drawyourdir.py /usr/local/bin/drawyourdir

# Now, if you write `drawyourdir` in the terminal, it should work

echo "drawyourdir is ready to use!"
