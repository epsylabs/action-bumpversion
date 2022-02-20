FROM python:3-slim AS builder
ADD . /app
WORKDIR /app

RUN pip install --target=/app bump2version

WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/entrypoint.sh"]
