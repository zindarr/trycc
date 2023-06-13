# Use the official lightweight Python image.
# https://hub.docker.com/_/python
# FROM python:3.9.6
FROM gcr.io/pollum-c23-pc648/trycc-pollum@sha256:a00799eac46347179e70a3747d167cc49837d53af50ffe07b7bd9caba639aeb2

# Copy local code to the container image.
WORKDIR /app
COPY . ./app

# Install production dependencies.
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Run the web service on container startup. Here we use the uvicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
# Timeout is set to 0 to disable the timeouts of the workers to allow Cloud Run to handle instance scaling.
EXPOSE 8080
COPY model/ model/
CMD exec uvicorn --bind :8080 main:app
