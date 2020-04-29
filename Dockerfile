FROM python:3.8-alpine
MAINTAINER Apteryx Labs Training Center
ENV PYTHONUNBUFFERED 1

#Install pipenv on the image, make reqs.txt
RUN pip install pipenv
COPY Pipfile* /tmp/
RUN cd /tmp && pipenv lock --requirements > /requirements.txt

#Install requirements to the Docker image.
#COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#Copy app files into Docker image.
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Make a user entity that will run all processes for the project.
RUN adduser -D user
USER user