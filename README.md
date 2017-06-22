# ILP Kit Docker-Compose

> Deploy a complete ILP kit through docker

This repository aims to reduce the setup time for ILP Kit to a single command. Depends on [docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/).

Installing Docker on a vps is not always as straight-forward as it may seem; there are several versions of Docker, and the docker-compose.yml file used in this repo is not compatible
with all of them. Before you start, consider whether the [Azure instructions](https://github.com/interledgerjs/ilp-kit-docker-compose/tree/master/azure) are an option for you,
they are the easiest ilp-kit install instructions to use.

In order to start an ILP Kit, you need to:

- Have a domain that points to your host machine.
- Have an email address (different from the above domain).
- Decide on a currency code for your ILP Kit's ledger.
- Generate a **SECURE** base64 secret value (eg. with `openssl rand 32 | base64`).

To start ILP Kit, run the command below, but with your own values instead of these
placeholders.

First, ping your domain name to double-check that it points to the IP address of your server.
If it does, ssh to your server, and run:

```sh
ILP_DOMAIN='example.com' \
ILP_EMAIL='alice@email.example' \
ILP_CURRENCY='USD' \
ILP_SECRET='Z4ZwCWbuo18eMrS1Tgn5L0FPUgK/2pKvgdvZzMogPw4' \
docker-compose up -d
```

Be very careful to use the same hostname, without spelling mistakes, in the `ILP_DOMAIN` variable there,
and in your DNS zone. This is the mistake that most often causes errors for this deploy method.

Also take care to use an upper-case currency code, not lower-case; it should be one of the currency codes supported by fixer.io (unless you configure your
ilp-kit with a custom exchange rate backend).

## Log in to your ilp-kit

First, wait for about 10 minutes! Until then, there will be nothing to see yet on your ilp-kit URL, or just an nginx default page.

Then, go to your ilp-kit's URL with your browser, and make sure to explicitly type 'https://' in the address bar first (so https://example.com,
and not http://example.com or example.com, in the example above). Once you see a login page, log in with user 'admin' and your
`ILP_SECRET` as the password.

If you deployed on Azure, then you will have a user and password for your vps; use these to ssh to your vps, and
when you log in, your `ILP_SECRET` will be printed as part of the ssh Welcome Banner.

If you generated your `ILP_SECRET` yourself like described above, then you can directly paste it into the password field on the login
page.

## Troubleshooting

You can watch the logs with `docker-compose logs -f ilp-kit`.

Check that all three containers started successfully, using `docker ps`, `docker ps -a` and for instance `docker logs letsencrypt`.

If the `letsencrypt`, `ilp-kit`, and `postgres` containers are all running, log in to your ilp-kit using user 'admin', and
using the `ILP_SECRET` you generated as the password.

To auto deploy to Azure see the [Azure Resource Template](./azure)

## Currently Included

- ILP Kit
- Postgres database (storing in the local `data` folder)
- Automatic Letsencrypt setup (storing certs and keys in the `data` folder)
- Nginx reverse proxy, exposing ILP Kit on port 443.

## Planned Additions

- Use different secrets between API, admin, connector, etc.
- Allow advanced configuration for options like Github and Mailgun.
