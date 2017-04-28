# ILP Kit Docker-Compose

> Deploy a complete ILP kit through docker

This repository aims to reduce the setup time for ILP Kit to a single command. Depends on [docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/).

_**Note**: This repository is not suitable for a production ILP Kit node in its current state._

To start ILP Kit, run:

```
docker-compose up -d
```

You can watch the logs with `docker-compose logs -f ilp-kit`.

# How it works

The docker-compose file runs postgres and creates a database which uses the local `data` folder as
a volume for its data. The ILP Kit is configured to use this postgres database.

Soon, an Nginx reverse proxy will be added, along with an automatic letsencrypt certbot, so that
you can deploy a production ILP Kit with this repository. Configuration tools will also be included;
the current docker compose file sets defaults for passwords, API secrets, and ILP prefix.
