# intall git and clone the repo into ~/github/setup

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt update

sudo apt install -y terminator copyq plocate apt-transport-https \
                    ca-certificates gnupg curl google-cloud-cli
sudo snap install --classic code intellij-idea-community goland
sudo snap install android-studio

chmod +x ~/github/setup/.bash_profile 
echo ". ~/github/setup/.bash_profile" >> ~/.bashrc