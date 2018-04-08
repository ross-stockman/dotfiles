sudo apt-get update
sudo apt-get install git -y

mkdir -p ~/git/bash
git clone https://github.com/ross-stockman/bash.git git/bash

mv ~/.bashrc ~/.bashrc_default

ln -fs ~/git/bash/bashrc ~/.bashrc

