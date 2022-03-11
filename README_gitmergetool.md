# How to set up 3-way merge tool for git and p4 with vimdiff

[source](https://alastochkinheroku.github.io/tech/cheatsheet/#links)
[source](https://blog.programster.org/configure-git-to-use-vimdiff)

* sudo touch /usr/local/bin/gitmergetool
* Add the following content into such file via your favorite text editor

```
#!/bin/bash
# script to accept arguments sending in from git mergetool
#
# Base is $1
# Remote (or Theirs) is $2
# Local (or Yours) is $3
# Merged is $4
vimdiff -c "wincmd J" -c "windo set wrap" "$4" "$3" "$1" "$2"

```
## Git
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff

Alternatively, add the following to your $HOME/.gitconfig

```
[diff]
    tool = vimdiff
[merge]
    tool = gitmergetool
    conflictstyle = diff3
[mergetool "gitmergetool"]
    cmd = gitmergetool \"$BASE\" \"$REMOTE\" \"$LOCAL\" \"$MERGED\"
[difftool]
    prompt = false
[mergetool]
    prompt = false
```


