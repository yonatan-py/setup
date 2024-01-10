# intall git and clone the repo into ~/github/setup

sudo apt update
sudo apt install -y apt-transport-https ca-certificates gnupg curl

sudo install -m 0755 -d /etc/apt/keyrings

# Add Google gpg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
    | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Add kubernetes gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' \
    | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Add Docker gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

./add_docker_repo.sh
sudo apt update

sudo apt install -y terminator copyq plocate google-cloud-cli docker-ce \
                    docker-ce-cli containerd.io docker-buildx-plugin \
                    docker-compose-plugin kubectl
sudo snap install --classic code intellij-idea-community goland kotlin
sudo snap install android-studio postman

sudo groupadd docker
sudo usermod -aG docker $USER

echo "Please log out and log back in to use docker without sudo"
read -p "Press enter to continue"

# add bash_profile to .bashrc
add_bash_profile_command=". ~/github/setup/.bash_profile"
if [ $(grep -c "$add_bash_profile_command" ~/.bashrc) -eq 0 ]; then
    chmod +x ~/github/setup/.bash_profile 
    echo "$add_bash_profile_command" >> ~/.bashrc
fi