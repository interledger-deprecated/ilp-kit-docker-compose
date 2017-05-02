# ILP Kit Docker-Compose

> Deploy a complete ILP kit through docker

This repository aims to reduce the setup time for ILP Kit to a single command. Depends on [docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/).

_**Note**: This repository is not suitable for a production ILP Kit node in its current state._

To start ILP Kit, run:

```
ILP_DOMAIN='example.com' ILP_EMAIL='alice@email.example' docker-compose up -d
```

You can watch the logs with `docker-compose logs -f ilp-kit`.

## Currently Included

- ILP Kit
- Postgres database (storing in the local `data` folder)
- Automatic Letsencrypt setup (storing certs and keys in the `data` folder)
- Nginx reverse proxy, exposing ILP Kit on port 443.

## Planned Additions

- Don't use hard-coded defaults for passwords, secrets, etc.
- Simple configuration parameters: domain, email, currency, and secret.
- Generate other configuration options from the provided ones.
- Fix ILP Kit native dependencies.
