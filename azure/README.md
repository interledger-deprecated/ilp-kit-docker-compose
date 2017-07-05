# Simple deployment of an Ubuntu VM with Docker and ILP-kit

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Finterledgerjs%2Filp-kit-docker-compose%2Ftestnet%2Fazure%2Fazure-deploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Finterledgerjs%2Filp-kit-docker-compose%2Ftestnet%2Fazure%2Fazure-deploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to deploy an Ubuntu VM which runs a script to install Docker compose and then run ILP-Kit.

You can connect to the VM via SSH to get the auto-generated secret used to login as admin on the ILP-Kit.

If you want to edit the docker-compose.yml file, it makes sense to run:
```sh
sudo chown -R `whoami` ilp-kit-docker-compose/
```

Note also that while your resource group is being set up, you have about 5 to 10 minutes to edit your DNS zone, in my case I added a CNAME record for `ilp-kit`, pointing to
`ilp-kit.eastus.cloudapp.azure.com` (because my VPS was deployed to the 'East US' region).
