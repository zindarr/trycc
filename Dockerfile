# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.9.6
# FROM gcr.io/pollum-c23-pc648/trycc-pollum@sha256:a00799eac46347179e70a3747d167cc49837d53af50ffe07b7bd9caba639aeb2

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8080

ENV PYTHONUNBUFFERED=1

# CMD ["python", "-u", "main.py"]

CMD ["uvicorn", "--host", "0.0.0.0", "--port", "8080", "main:app"]
