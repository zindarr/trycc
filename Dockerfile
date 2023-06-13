# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.9.6
# FROM gcr.io/pollum-c23-pc648/trycc-pollum@sha256:a00799eac46347179e70a3747d167cc49837d53af50ffe07b7bd9caba639aeb2

WORKDIR /app
COPY . ./app
COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY model/ model/

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
