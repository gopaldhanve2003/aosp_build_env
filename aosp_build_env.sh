#!/usr/bin/env bash

echo "Let's start setup"

#Update & Upgrade Packages
echo -e "Updating and Upgrading Ubuntu Packages..."
sudo apt update && sudo apt upgrade -y
echo "Package updates completed."

# Install Essential Stuff
echo -e "Installing Essential Stuff"
sudo apt install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 libncurses5 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
sudo apt install -y python3 python-is-python3 rsync ssh tmate
echo "Essential stuff are installed successfully."

# Download and Install Repo
echo -e "Installing Repo"
# Download the Repo binary from the official URL
sudo curl --create-dirs -L https://storage.googleapis.com/git-repo-downloads/repo -o /usr/local/bin/repo
# Set executable permissions for the Repo binary
sudo chmod a+rx /usr/local/bin/repo
echo "Repo installed successfully"

# Install GitHub CLI
echo -e "Installing GitHub CLI"
# Download the GitHub CLI keyring
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
# Set permissions for the keyring file
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
# Add the GitHub CLI repository to the APT sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
# Update the APT package index
sudo apt update
# Install the GitHub CLI
sudo apt install gh -y
echo "GitHub CLI installed successfully"

echo "All stuff is installed successfully."

# Prompt user if they want to set up Git credentials
read -p "Do you want to set up your Git credentials? (y/n) " confirm

if [[ $confirm == "y" || $confirm == "Y" ]]; then
  bash gitcred.sh
else
  echo "Skipping Git credential setup..."
  echo "You're good to go."
fi