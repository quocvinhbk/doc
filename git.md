- git config local:
```
git config user.name "username"
git config user.email "email@example.com"
git config --global user.name
git config --global user.email
```
- generate ssh-keygen with email: 
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
pbcopy < ~/.ssh/id_rsa.pub
```

- account check
```
ssh -vT git@github.com
```

- ssh cache key
```
add: ssh-add ~/.ssh/dir/id_rsa
delete: ssh-add -D
list: ssh-add -l

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/dir/id_rsa
```


# githubPersonal
Host personal
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa

# githubWork
Host work
   HostName ssh.github.com
   Port 443
   User git
   IdentityFile ~/.ssh/id_rsa_zigexn
