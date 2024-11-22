# Updating git config for efficient use of git commands

## Log View, Command: git lg
Add the Below lines in git config file
```
[alias]
    lg = log --topo-order --all --graph --date=local --pretty=format:'%C(green)%h%C(reset) %><(55,trunc)%s%C(red)%d%C(reset) %C(blue)[%an]%C(reset) %C(yellow)%ad%C(reset)%n'
```
