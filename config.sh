#!/bin/sh

#AWS Information
ACCESS_KEY=''
SECRET_KEY=''
EC2_REGION=''
EC2_AMIS=''
EC2_KEYPAIR=''
EC2_SECGROUPS=''
EC2_INSTANCETYPE=''

#SSH Key Path
SSH_KEY_FILE_PATH=''

#Server Memory Size
#This is default to no memory specification but can be:'-Xmx1024M -Xms1024M'
MEMORY_ALLOCATION=''

# Server password (to access via Heroku)
SERVER_PASSWORD=''

# Setting up Heroku's config vars (like environment variables) for safely storing of credentials
# DON'T CHANGE THIS
heroku config:set ACCESS_KEY=\'$ACCESS_KEY\' SECRET_KEY=\'$SECRET_KEY\' EC2_REGION=\'$EC2_REGION\' EC2_AMIS=\'$EC2_AMIS\' EC2_KEYPAIR=\'$EC2_KEYPAIR\' EC2_SECGROUPS=\'$EC2_SECGROUPS\' EC2_INSTANCETYPE=\'$EC2_INSTANCETYPE\' SSH_KEY_FILE_PATH=\'$SSH_KEY_FILE_PATH\' MEMORY_ALLOCATION=\'$MEMORY_ALLOCATION\' SERVER_PASSWORD=\'$SERVER_PASSWORD\'