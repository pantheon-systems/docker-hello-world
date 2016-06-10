FROM quay.io/getpantheon/alpine:latest

RUN apk add --update \
    python \
    py-pip \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app

RUN virtualenv /app/venv \
  && /app/venv/bin/pip install -r /app/requirements.txt

EXPOSE 5000

ENV FLASK_APP="/app/main.py"

CMD ["/app/venv/bin/flask", "run", "--host=0.0.0.0"]
