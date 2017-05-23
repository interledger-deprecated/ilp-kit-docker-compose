sudo apt-get install -y git
cd /home/$4
git clone https://github.com/interledgerjs/ilp-kit-docker-compose.git
#Set ENV Variables here
sudo apt-get install -y openssl
password=$(openssl rand -base64 32 | cut -c1-32|tr "/" +)
touch /etc/motd
echo "***********************************************"\
   " Your password for ILP is $password"\
   "**********************************************" > /etc/motd
export ILP_DOMAIN=$1
export ILP_EMAIL=$2
export ILP_CURRENCY=$3
export ILP_SECRET=$password
cd ilp-kit-docker-compose
docker-compose up -d 
