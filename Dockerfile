FROM python:3.11-slim

#set working directory in the container (also create it)
WORKDIR /app

#create the directory for logs
RUN mkdir logs

#copy the  current directory contents into the container at /app
COPY ./app

#EXPOSE 80
