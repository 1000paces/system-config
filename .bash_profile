if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi source /Users/rmiles/.bash_profile

#export ES_HOME=~/apps/elasticsearch/elasticsearch-2.3.1
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_77/Contents/Home
#export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
export AWS_ACCESS_KEY_ID="AKIAI4K2HYTGQSTK63MA"
export AWS_SECRET_ACCESS_KEY="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"

export PATH="/usr/local/bin/elasticsearch/bin:$PATH"
export PATH="/usr/local/opt/qt5/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

 [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias ssh_staging="ssh -i ~/.ssh/1kp.pem ubuntu@staging.flexjobs.com"
