# Use the official lightweight Python image.
# https://hub.docker.com/_/python
# FROM python:3.9.6
FROM gcr.io/pollum-c23-pc648/trycc-pollum@sha256:a00799eac46347179e70a3747d167cc49837d53af50ffe07b7bd9caba639aeb2

# Use working directory /app/model
WORKDIR /app/model

# Copy and install required packages
COPY requirements.txt .
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy all the content of current directory to working directory
COPY . .

# Set env variables for Cloud Run
ENV PORT 80
ENV HOST 0.0.0.0

EXPOSE 80:80

# Run flask app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
