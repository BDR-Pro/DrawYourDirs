Write-Host "Setting up drawyourdir..."

# Check if pip is installed
if (-not (Get-Command pip -ErrorAction SilentlyContinue)) {
    Write-Host "pip could not be found, please install it first."
    exit
}

# Install pathspec Python package
pip install pathspec

# Copy the script to /usr/local/bin
$destinationPath = "C:\Program Files\drawyourdir"
New-Item -ItemType Directory -Path $destinationPath -Force | Out-Null
Copy-Item -Path "drawyourdir.py" -Destination "$destinationPath\drawyourdir.py" -Force

# Make the script executable
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Bypass -Force

# if you write drawyourdir in cmd, it will run the script

# Add the script to the PATH

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";$destinationPath"

# Done

Write-Host "drawyourdir is ready to use!"