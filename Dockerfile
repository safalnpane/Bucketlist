# Pull base python image
FROM python:latest

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update && apt -y install libpq-dev gcc python3-dev
RUN pip install --upgrade pip
RUN pip install psycopg2

# Set working directory
WORKDIR /code

# Install the dependencies
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

# Copy project files
COPY . /code

EXPOSE 8000
