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
ssh -T git@github.com
```
- [git multiple account](https://medium.com/@fredrikanderzon/setting-up-ssh-keys-for-multiple-bitbucket-github-accounts-a5244c28c0ac)

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
ssh-keygen -t rsa -C "companyName" -f "companyName"
ssh-keygen -t rsa -b 4096 -C "vinhnq@zigexn.vn"


ssh-add ~/.ssh/companyName
```

- [ssh simplify](https://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/)

- ssh-config-key
```
Host github.com/
    User git
    HostName github.com
    IdentityFile ~/.ssh/github.project1.key
Host github-org
    User git
    HostName github.com
    IdentityFile ~/.ssh/github.org.key
Host github.com
    User git
    IdentityFile ~/.ssh/github.key
```