import os
import socket

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    hostname = socket.gethostname()
    hello_target = os.environ.get('HELLO_TARGET', 'World')
    return 'Hello, {}, from {}!\n'.format(hello_target, hostname)
