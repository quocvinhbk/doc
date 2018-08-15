#### blog
[hackerNew](https://news.ycombinator.com/item?id=5316093)
[opsschool](http://www.opsschool.org/en/latest/introduction.html)
[5minutes server](https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)


# 3 linux tip

- add user

```useradd -aG root, wheel admin
passwd admin

usermod -aG root admin

yum install sudo
sudo visudo
admin     ALL=(ALL)    ALL
su - admin
```

- find

``` find . -name "*.txt"
```

# 4 setup bash

- .bash_profile

``` if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
```

- .zshrc    reload: source ~/.zshrc

```source /Users/g2/.bashrc
```

[macos setup 1](https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/)
[macos setup 2](https://github.com/nicolashery/mac-dev-setup)
[macos setup 3](https://medium.com/@tzhenghao/a-guide-to-building-a-great-bashrc-23c52e466b1c)

[linux command](https://www.cyberciti.biz/faq/how-do-i-find-out-what-ports-are-listeningopen-on-my-linuxfreebsd-server/)

- check listening port ``` lsof -i :3000 OR lsof -i :1-1024```

#### unix absolute path and relative path: 
  * absolute path: start with character '/': meaning root path
  * relative path: from present working directory ( pwd )

### digital ocean
  * 178.128.48.97

#### ssh key [https://wiki.centos.org/HowTos/Network/SecuringSSH]

##### root

```
useradd user1
passwd user1

sudo visudo
> user1 ALL(ALL)   ALL

sudo vi /etc/ssh/sshd_config
> AlowUsers user1
```

##### user1

```
su - user1
sudo vi ~/.ssh/authorized_keys
> puts your local publish key. Usually, run at local: $ cat ~/.ssh/id_rsa.pub

sudo chown 700 ~/.ssh
sudo chown 600 ~/.ssh/*
```


systemctl enable nginx
systemctl enable mysqld



/home/admin/.rbenv/versions/2.5.1/bin/ruby