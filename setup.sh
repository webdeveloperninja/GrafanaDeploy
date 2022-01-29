echo "### Setting up docker."

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

echo "### Setting up docker compose."

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "### creating grafana data directory."

mkdir -p "data/grafana"
mkdir -p "/var/lib/grafana"

echo "### initialize lets encrypt."
sudo chmod +x ./init-letsencrypt.sh
sudo ./init-letsencrypt.sh
