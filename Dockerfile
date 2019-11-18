FROM python:3.8-alpine
MAINTAINER paritosh666

# Doesnot allow python to buffer the outputs, prints them directly. 
ENV PYTHONUNBUFFERED 1

# Installing Dependencies.

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# creating a directory 
RUN mkdir /src
#switching to /src as working dirctory
WORKDIR /src
#copies /src directory in our local machine to /src directory in our image.
COPY ./src /src

# Creating a user with a username 'user'
# -D restricts user to run application only. Not for logging or anything else. Just for application process
RUN adduser -D user
# Switching to user
USER user

