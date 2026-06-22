#!/bin/bash
# create_user.sh
# Usage: sudo bash create_user.sh username "Full Name"

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
  exit 1
fi

USERNAME="$1"
FULLNAME="$2"

if id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME already exists"
  exit 1
fi

# Create user with home directory and add to sudo group (adjust as needed)
useradd -m -c "$FULLNAME" -s /bin/bash "$USERNAME"
passwd -l "$USERNAME"  # lock password until set securely
usermod -aG sudo "$USERNAME"

echo "User $USERNAME created. Please set password and share secure onboarding steps."
