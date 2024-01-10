latest_version=$(curl -sSL https://golang.org/dl/?mode=json | jq -r '.[0].version')
install_dir="~/go"

curl -O https://golang.org/dl/$latest_version.linux-amd64.tar.gz
sudo tar -C $install_dir -xzf $latest_version.linux-amd64.tar.gz
sudo rm $latest_version.linux-amd64.tar.gz
