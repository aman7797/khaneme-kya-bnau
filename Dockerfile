FROM python:3.7-alpine
MAINTAINER Aman Lalpuria

# Tell python to run on unbuffered mode. This tells it run in unbuffered mode which is recommended when running Python within docker container.
# The reason for this is that it doesn't allow Python to buffer the outputs. It prints them directly
ENV PYTHONUNBUFFERED 1

# it take requirements from requirements.txt and store it using pip
COPY ./requirements.txt /requirements.txt 
RUN pip install -r /requirements.txt

# this will make a directory within our docker image that we can use to store our application source code
# 1. Create a directory app
# 2. Make app as working directory or current directory
# 3. Copy local app directory to the app directory
RUN mkdir /app 
WORKDIR /app
COPY ./app /app

# username is user
# -D tells that user is just allow to run the processes or application
RUN adduser -D user
# to switch to the user created above
USER user