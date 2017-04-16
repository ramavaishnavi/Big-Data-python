```bash
sudo yum install gcc
sudo yum install git

sudo yum install -y centos-release-SCL
```

Install python on clouderaVM following this link https://www.digitalocean.com/community/tutorials/how-to-set-up-python-2-7-6-and-3-3-3-on-centos-6-4

## Add these lines to ~/.bashrc
vim ~/.bashrc

alias python=python2.7
export PATH="/usr/local/bin:$PATH"

