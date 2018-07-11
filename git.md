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
- [ssh simplify](https://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/)

- [multiple-ssh-setting](https://gist.github.com/jexchan/2351996)


- ssh cache key
```
add: ssh-add ~/.ssh/dir/id_rsa
delete: ssh-add -D
list: ssh-add -l
```

```
#foobar account
Host github.com-foobar
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_rsa_foobar
```