go_path=$HOME/go-sdk/$(ls $HOME/go-sdk | head -1)
export GOPATH=$go_path
export GOBIN=$go_path/bin
export PATH=$PATH:$GOBIN:$GOPATH

eval "$(kind completion bash)"
eval "$(kubectl completion bash)"