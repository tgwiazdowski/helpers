#install brew
#install node
#install composer for php
xcode-select --install
sudo chmod -R 777 /Library/WebServer/Documents

#ssh timeout
nano ~/.ssh/config
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 5

#block websites
sudo sh -c "echo '127.0.0.1 wykop.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.wykop.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 reddit.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.reddit.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 techcrunch.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 antyweb.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 news.ycombinator.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 di.com.pl' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 facebook.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.facebook.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 linkedin.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.linkedin.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 twitter.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.twitter.com' >> /etc/hosts"
sudo sh -c "echo '127.0.0.1 www.macrumors.com' >> /etc/hosts"
dscacheutil -flushcache

#Git http://haacked.com/archive/2014/07/28/github-flow-aliases/
nano ~/.gitconfig 
[alias]
    co = checkout
    ec = config --global -e
    up = !git pull --rebase --prune $@ && git submodule update --init --recursive
    cob = checkout -b
    cm = !git add -A && git commit -m
    pall = "!func(){ git add . && git commit -aqm $1 && git pull -q --no-progress && git push -q; }; func"
    save = !git add -A && git commit -m 'SAVEPOINT'
    wip = !git add -u && git commit -m "WIP" 
    undo = reset HEAD~1 --mixed
    amend = commit -a --amend
    wipe = !git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard
    bclean = "!f() { git branch --merged ${1-master} | grep -v " ${1-master}$" | xargs -r git branch -d; }; f"
    bdone = "!f() { git checkout ${1-master} && git up && git bclean ${1-master}; }; f"
