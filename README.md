Clone this repo and setup the links

```
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git -y

mkdir -p ~/git/bash
git clone https://github.com/ross-stockman/bash.git git/bash

mv ~/.bashrc ~/.bashrc_default

ln -fs ~/git/bash/bashrc ~/.bashrc
```
Install the usual things

```
sudo apt-get install vim openssh-server ssh wget unzip vim htop curl libxml2-utils default-jdk scala ant maven gradle -y
```
Create a secrets file
Download jasypt and set $JASYPT_HOME
