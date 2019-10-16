import sys
import os
import boto3

client = boto3.resource(
            'ec2',
            aws_access_key_id=os.environ['ACCESS_KEY'],
            aws_secret_access_key=os.environ['SECRET_KEY'],
            region_name=os.environ['EC2_REGION']
        )
response = client.create_instances(ImageId = os.environ['EC2_AMIS'],
    InstanceType = os.environ['EC2_INSTANCETYPE'], 
    KeyName = os.environ['EC2_KEYPAIR'],
    MaxCount = 1,
    MinCount = 1,
    SecurityGroups = os.environ['EC2_SECGROUPS']) # maybe needs to be a list

print("INSTANCE CREATED")
print("INSTANCE ID: " + response[0].id)