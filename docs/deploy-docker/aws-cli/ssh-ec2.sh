#!/bin/bash
# A script that will ssh into an AWS EC2 instance using its instance ID and key
# pair.

# NOTE: This script will not work with student AWS accounts. I am leaving it
# here for reference.

# Update the KEYNAME, USERNAME, and INSTANCE variables to match your setup
KEYNAME="todo.pem"
USERNAME="ubuntu" # Default username for Ubuntu AMIs


if [ ! -f "$KEYNAME" ]; then
    echo "Key file $KEYNAME not found!"
    exit 1
fi

if [ ! -f "instance_id.txt" ]; then
    echo "Instance ID file not found! Please create it by running launch-ec2.sh first."
    exit 1
fi

INSTANCE=$(cat instance_id.txt)

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found! Please install it to proceed."
    exit 1
fi

# Get the public DNS of the instance
INSTANCE=$(aws ec2 describe-instances --instance-ids "$INSTANCE" --query "Reservations[0].Instances[0].PublicDnsName" --output text)
if [ -z "$INSTANCE" ]; then
    echo "Could not retrieve instance information. Please check the instance ID."
    exit 1
fi
# Set permissions for the key file
chmod 400 "$KEYNAME"

# SSH into the instance
ssh -o StrictHostKeyChecking=accept-new  -i "$KEYNAME" "$USERNAME@$INSTANCE"
