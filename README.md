docker hello-world (flask app)
==============================

[![Unofficial](https://img.shields.io/badge/Pantheon-Unofficial-yellow?logo=pantheon&color=FFDC28)](https://pantheon.io/docs/oss-support-levels#unofficial)

Python Flask "Hello world" app in a docker container for demo purposes.

Build & Push
-------------

- Run `make build`.
- Run `make push`.

Run local
---------

Start container:

```
$ docker run --rm -p 5000:5000 us-central1-docker.pkg.dev/pantheon-sandbox/onboarding/hello-world
 * Serving Flask app "main"
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
```

Curl it:

```
$ curl localhost:5000/
Hello, World!
```

Note: If you're on OSX, you need to run `docker-machine ip default` (assuming
`default` is the name of your docker-machine instance) in order to get the IP
of the docker VM instead of using `localhost`, example:

```
$ docker-machine ip default
192.168.99.100

$ curl 192.168.99.100:5000/
Hello, World!

## or:

$ curl $(docker-machine ip default):5000/
Hello, World!
```
