- add user
```
useradd -aG root, wheel admin
passwd admin

usermod -aG root admin

yum install sudo
sudo visudo
admin     ALL=(ALL)    ALL
su - admin
```

# 4 setup bash: 

- .bash_profile:
```
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
```
- .zshrc
```
source /Users/g2/.bashrc
```

[macos setup 1](https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/)
[macos setup 2](https://github.com/nicolashery/mac-dev-setup)
[macos setup 3](https://medium.com/@tzhenghao/a-guide-to-building-a-great-bashrc-23c52e466b1c)
