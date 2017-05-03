# ILP Kit Docker-Compose

> Deploy a complete ILP kit through docker

This repository aims to reduce the setup time for ILP Kit to a single command. Depends on [docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/).

In order to start an ILP Kit, you need to:

- Have a domain that points to your host machine.
- Have an email address (different from the above domain).
- Decide on a currency code for your ILP Kit's ledger.
- Generate a **SECURE** base64 secret value (eg. with `openssl rand 32 | base64`).

To start ILP Kit, run the command below, but with your own values instead of these
placeholders.

```sh
ILP_DOMAIN='example.com' \
ILP_EMAIL='alice@email.example' \
ILP_CURRENCY='USD' \
ILP_SECRET='Z4ZwCWbuo18eMrS1Tgn5L0FPUgK/2pKvgdvZzMogPw4' \
docker-compose up -d
```

You can watch the logs with `docker-compose logs -f ilp-kit`.

## Currently Included

- ILP Kit
- Postgres database (storing in the local `data` folder)
- Automatic Letsencrypt setup (storing certs and keys in the `data` folder)
- Nginx reverse proxy, exposing ILP Kit on port 443.

## Planned Additions

- Use different secrets between API, admin, connector, etc.
- Allow advanced configuration for options like Github and Mailgun.
