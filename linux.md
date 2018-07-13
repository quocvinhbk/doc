add user
```
useradd -G root, wheel admin
passwd admin

usermod -aG root admin

yum install sudo
sudo visudo
admin     ALL=(ALL)    ALL
su - admin
```
