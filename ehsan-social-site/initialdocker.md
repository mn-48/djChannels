#### Dockerfile

```
FROM python:3.6-slim

ENV PYTHONUNBUFFERED 1

WORKDIR /Demo

ADD . /Demo

COPY ./requirements.txt /Demo/requirements.txt

RUN pip install -r requirements.txt

COPY . /Demo
``` 

#### Docker-compose

```
version: "3"

services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    command: python manage.py runserver 0.0.0.0:8000
    ports:
      - 8000:8000
```