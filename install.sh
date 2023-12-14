mkdir ~/github

sudo apt update
sudo apt install -y terminator copyq plocate
sudo snap install --classic code intellij-idea-community goland
sudo snap install android-studio

chmod +x ~/github/setup/.bash_profile 
echo ". ~/github/setup/.bash_profile" >> ~/.bashrc