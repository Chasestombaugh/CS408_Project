#!/bin/bash
# Terminate an AWS EC2 instance using its instance ID.

if [ ! -f "instance_id.txt" ]; then
    echo "Instance ID file not found! Please create it by running launch-ec2.sh first."
    exit 1
fi
INSTANCE_ID=$(cat instance_id.txt)
# Terminate the EC2 instance
aws ec2 terminate-instances --instance-ids "$INSTANCE_ID"
if [ $? -ne 0 ]; then
    echo "Failed to terminate instance with ID: $INSTANCE_ID"
    exit 1
fi
# Optionally, wait for the instance to be terminated
aws ec2 wait instance-terminated --instance-ids "$INSTANCE_ID"
echo "Instance is now terminated."
# Remove the instance_id.txt file
rm -f instance_id.txt
echo "Removed instance_id.txt file."