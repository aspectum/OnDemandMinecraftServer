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
JAVA_FLAGS=''

# Server password (to access via Heroku)
SERVER_PASSWORD=''

# Setting up Heroku's config vars (like environment variables) for safely storing of credentials
# -----------DON'T CHANGE ANYTHING BELOW THIS LINE-----------
SSH_KEY="$(<$SSH_KEY_FILE_PATH)"
heroku config:set ACCESS_KEY="$ACCESS_KEY" SECRET_KEY="$SECRET_KEY" EC2_REGION="$EC2_REGION" EC2_AMIS="$EC2_AMIS" EC2_KEYPAIR="$EC2_KEYPAIR" EC2_SECGROUPS="$EC2_SECGROUPS" EC2_INSTANCETYPE="$EC2_INSTANCETYPE" JAVA_FLAGS="$JAVA_FLAGS" SERVER_PASSWORD="$SERVER_PASSWORD" SSH_KEY="$SSH_KEY"
# Regular environment variables for createInstance.py
export ACCESS_KEY="$ACCESS_KEY"
export SECRET_KEY="$SECRET_KEY"
export EC2_REGION="$EC2_REGION"
export EC2_AMIS="$EC2_AMIS"
export EC2_INSTANCETYPE="$EC2_INSTANCETYPE"
export EC2_KEYPAIR="$EC2_KEYPAIR"
export EC2_SECGROUPS="$EC2_SECGROUPS"