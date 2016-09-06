#!/bin/bash

source .env
cd MsgApp
echo 'Hi there!'
su -m kcm -c "echo $SECRET_KEY"
# migrate db, so we have the latest db schema
# su -m kcm -c "python manage.py db init"
# su -m kcm -c "python manage.py db migrate"  
su -m kcm -c "python manage.py db upgrade"
# start development server on public ip interface, on port 3000 (or PORT)
su -m kcm -c "python MsgApp/runserver.py"
