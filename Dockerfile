FROM us-docker.pkg.dev/pantheon-artifacts/internal/alpine:3.14

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools virtualenv

WORKDIR /app
COPY . /app

RUN virtualenv /app/venv \
  && /app/venv/bin/pip install -r /app/requirements.txt

EXPOSE 5000

ENV FLASK_APP="/app/main.py"

CMD ["/app/venv/bin/flask", "run", "--host=0.0.0.0"]
