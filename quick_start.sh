#!/bin/bash

# Check if account_id is provided
if [ -z "$1" ]; then
    echo "Usage: ./quick_start.sh <account_id>"
    echo "Example: ./quick_start.sh 123456789"
    echo ""
    echo "You can find your account_id in the informer.env file (TELEGRAM_ACCOUNT_ID)"
    exit 1
fi

ACCOUNT_ID=$1

# change to app directory
cd ./app

# create virtual env
python3 -m venv venv

# load venv
source venv/bin/activate

# install requirements in this env
pip install -r requirements.txt

#run the bot
python3 bot.py $ACCOUNT_ID
