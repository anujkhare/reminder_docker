# use base python image with python 2.7
FROM python:3.5

# add requirements.txt to the image
ADD requirements.txt /MsgApp/requirements.txt

# set working directory to /app/
WORKDIR /MsgApp/

# install python dependencies
RUN pip install -r requirements.txt

# create unprivileged user
RUN adduser --disabled-password --gecos '' kcm
