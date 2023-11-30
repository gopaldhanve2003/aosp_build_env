#!/usr/bin/env bash
echo "Let's set up your Git credentials."

# Validate Git username
function validateUsername() {
    # Regular expression for valid Git usernames
    pattern='^[a-zA-Z0-9_.@+-]{3,25}$'

    # Check if the username matches the pattern
    if [[ $1 =~ $pattern ]]; then
        return 0
    else
        return 1
    fi
}

# Validate Git email-ID
function validateEmail() {
    # Regular expression for valid email addresses
    pattern='^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

    # Check if the email address matches the pattern
    if [[ $1 =~ $pattern ]]; then
        return 0
    else
        return 1
    fi
}

# Validate Git username and email-ID
while true; do
    read -p "Enter your Git username: " username
    if ! validateUsername $username; then
        echo "Invalid Git username. Please enter a valid username with at least 3 and at most 25 characters, including alphanumeric characters, '_', '.', '@', '+', or '-'."
    else
        break
    fi
done

while true; do
    read -p 'Enter your Git email-ID: ' emailID
    if ! validateEmail $emailID; then
        echo "Invalid Git email address. Please enter a valid email address in the format 'username@domain.com'."
    else
        break
    fi
done

# Set Git username and emailID
git config --global user.name "$username"
git config --global user.email "$emailID"

# Store user credentials
while true; do
 read -p "Do you want to store your Git credentials (y/n)? " be
 case $be in
   [Yy] )
     while true; do
       read -p "Enter the desired timeout in hours (default: 2): " timeout
       if [[ $timeout =~ ^[0-9]+$ ]] || [[ -z $timeout ]]; then
         timeout=${timeout:-2} # Set default timeout to 2 hours if user doesn't provide input
         echo "Storing your Git credentials with a timeout of $timeout hours."
         git config --global credential.helper "cache --timeout=$(expr $timeout \* 3600)"
         echo "You're good to go."
         break
       else
         echo "Invalid timeout. Please enter an integer value for the timeout in hours."
       fi
     done
     break;;
   [Nn] ) echo "You're good to go."; break ;;
   * ) echo "Invalid response. Please enter 'y' or 'n'."; continue ;;
 esac
done