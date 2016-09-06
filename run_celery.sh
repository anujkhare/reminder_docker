#!/bin/bash

source .env
cd MsgApp
# run Celery worker for our project myproject with Celery configuration stored in Celeryconf
su -m kcm -c "celery -A MsgApp.celery worker --loglevel=info --beat"
