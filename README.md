# Nexus Lab Testnet using docker compose

### Prerequisites
Have docker installed.
Install docker:
```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove -qy $pkg; done
sudo apt -qy update
sudo apt -qy install curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -qy
sudo apt install -qy docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Steps
1. Go to: [beta.nexus.xyz](https://beta.nexus.xyz).
2. Get Prover ID at the left bottom corner
3. Clone This Repository
   ```bash
   git clone https://github.com/CryptoNodeID/nexus-xyz-cli.git
   cd nexus-xyz-cli
5. Put the Prover ID in docker-compose.yml
6. Run
   ```bash
   docker compose up -d

* To check logs
   ```bash
   docker compose logs -fn 100
