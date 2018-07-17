- git config local:

- [test multiple key](https://developer.atlassian.com/blog/2016/04/different-ssh-keys-multiple-bitbucket-accounts/)

```git config user.name "username"
git config user.email "email@example.com"
git config --global user.name
git config --global user.email
```

- generate ssh-keygen with email:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f "~/.ssh/id_rsa_user1"
pbcopy < ~/.ssh/id_rsa.pub
```

- account check

``` ssh -vT git@github.com
```

- ssh cache key

```
add: ssh-add ~/.ssh/dir/id_rsa
delete: ssh-add -D
list: ssh-add -l

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/dir/id_rsa_user1
```

# bitbucket account
Host bitbucket.org-user1
  HostName bitbucket.org
  User git
  IdentityFile ~/.ssh/id_rsa_user1
  IdentitiesOnly yes


# 4 Configure your Git repo
If you don't have a local copy of your repo, you have to run the following command to clone a Bitbucket repository:

@bitbucket.org-user1:use

```
git clone git@bitbucket.org-user1:user1/your-repo-name.git
```

If you already have a local copy, you'll need to update the origin:

```
git remote set-url origin git@bitbucket.org-user1:user1/your-repo-name.git
```

Now go to the local Git repo that you want to configure and enter:

```
git config user.name "user1"
git config user.email "user1@example.com"
```

Where user1 matches the values you used earlier in your ssh config.

You can now git push as normal and the correct key will automatically be used.

I hope you found this tip useful! Check out our earlier Tips of the Week or tweet your own tip suggestions to @pvdevoor."