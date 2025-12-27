#!/bin/bash

# A script to launch a new AWS EC2 instance using a specified AMI, instance
# type, key pair, and security group.

# Update the following variables to match your setup
aws configure set region us-west-2

AMI_ID="ami-00f46ccd1cbfb363e" # Replace with your desired AMI
INSTANCE_TYPE="t3.micro" # Replace with your desired instance type
KEY_NAME="todo" # Replace with your key pair
SECURITY_GROUP="todo" # Replace with your security group ID
REGION="us-west-2" # Replace with your desired region

# Set key permissions
KEY_FILE="${KEY_NAME}.pem"
if [ ! -f "$KEY_FILE" ]; then
    echo "Key file $KEY_FILE not found!"
    exit 1
fi
chmod 400 "$KEY_FILE"

# Set AWS CLI region
aws configure set region ${REGION}
# Launch the EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
    --image-id "$AMI_ID" \
    --count 1 \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$SECURITY_GROUP" \
    --query "Instances[0].InstanceId" \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyWebserverInstance}]' \
    --output text)
if [ -z "$INSTANCE_ID" ]; then
    echo "Failed to launch instance."
    exit 1
fi
echo "Launched instance with ID: $INSTANCE_ID"
echo $INSTANCE_ID > $INSTANCE_ID.txt
# Wait for the instance to be in running state
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
echo "Instance is now running."
# Retrieve the public DNS of the instance
PUBLIC_DNS=$(aws ec2 describe-instances \
    --instance-ids "$INSTANCE_ID" \
    --query "Reservations[0].Instances[0].PublicDnsName" \
    --output text)
echo "Instance Public DNS: $PUBLIC_DNS"
