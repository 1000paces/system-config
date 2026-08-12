# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/opt/postgresql@16/bin:/Users/rmiles/1000paces/git/ies-r2g/bin:$PATH
export OPENAI_API_KEY=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
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Path to your oh-my-zsh installation.
export ZSH="/Users/rmiles/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
 )

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
#
# alias ssh_staging="ssh -i ~/.ssh/1kp.pem ubuntu@staging.flexjobs.com"
# alias ssh_fj_staging="ssh -i ~/.ssh/1kp.pem ubuntu@fj-staging.com"
# alias dc="docker-compose"

export PATH="/opt/homebrew/bin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DISALBE_SPRING=true

# eval "$(rbenv init -)"

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

alias rake='noglob rake'
alias dc='docker-compose'
alias ximg='cpln image delete red2green:3.2.2--pre-cache'

deploy() {
  DEPLOY_USER=ron cap $1 docker:deploy
}

tail_logs() {
  DEPLOY_USER=ron cap $1 docker:logs$2
}

function gcbi(){
  if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "invalid arguments: gcbi <issue#> <description>"
  else
    git checkout -b DEV-"$1"-"$2" && git push --set-upstream origin DEV-"$1"-"$2"
  fi
}

function gcom(){
  git add . && git commit -a --no-verify
}

function sha(){
  cd /Users/rmiles/1000paces/git/ies-r2g
  git rev-parse --short HEAD
}

function my_work() {
  cd /Users/rmiles/1000paces/git/ies-r2g
  if [ "$(date +%u)" -eq 1 ]; then # Check if it's Monday (1 = Monday)
    git log --all --author="1000paces" --since="3 days ago" --oneline
  else
    git log --all --author="1000paces" --since="2 day ago" --oneline
  fi
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

_accept_suggestion_or_forward() {
  if [[ -n "$POSTDISPLAY" ]]; then
    zle autosuggest-accept
  else
    zle forward-char
  fi
}
zle -N _accept_suggestion_or_forward
bindkey '^[[C' _accept_suggestion_or_forward  # right arrow (most terminals)
bindkey '^[OC' _accept_suggestion_or_forward  # right arrow (tmux/application mode)

PATH="/Users/rmiles/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/rmiles/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/rmiles/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/rmiles/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/rmiles/perl5"; export PERL_MM_OPT;
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

function data(){
   YESTERDAY=$(date -v -1d +"%Y-%m-%d")
   FNAME="r2g_production-$YESTERDAY.psql"
   ies && scp "prod:/home/ron/backup/$FNAME" ~/Downloads && rake db:drop && rake db:create && rake db:schema:load && pg_restore -d ies_r2g_development "~/Downloads/$FNAME"
}

function db() {
  pgcli ies_r2g_development
}

function rc() {
  rails console
}

function fs() {
  foreman s
}

alias python=/usr/bin/python3

alias yc='yarn codegen && yarn graphql-codegen --config codegen.ts'

function pgr() {
  pg_restore -F c -j 5 -v -c -d ies_r2g_development $1
}

# Connect to Production CPLN workload
function prod() {
  cpln workload connect prod --location aws-us-east-1 --container red2green --shell sh --org red2green-prod --gvc red2green
}

# Connect to sprint CPLN workload
function sprint() {
  cpln workload connect sprint --location aws-us-east-1 --container red2green --shell sh --org red2green-dev --gvc red2green
}

# Connect to release CPLN workload
function release() {
  cpln workload connect release --location aws-us-east-1 --container red2green --shell sh --org red2green-dev --gvc red2green
}

# Connect to app CPLN workload
function app() {
  cpln workload connect app --location aws-us-east-1 --container red2green --shell sh --org red2green-prod --gvc red2green
}

# Connect to app CPLN workload
function e2e() {
  cpln workload connect e2e --location aws-us-east-1 --container red2green --shell sh --org red2green-dev --gvc red2green
}

# Connect to app CPLN workload
function demo() {
  cpln workload connect demo --location aws-us-east-1 --container red2green --shell sh --org red2green-prod --gvc red2green
}

# Connect to workload for current branch
function wl() {
  # Convert branch to lower case
  BRANCH=$(git branch --show-current | awk '{print tolower($0)}')
  print "Branch is $BRANCH"
  
  if [[ $BRANCH =~ (dev-[0-9]+) ]]; then
    print "Subomain is ${match[1]}"
  else
    print $MATCH
    print "no match"
  fi

  SUBDOMAIN="${match[1]}"
  print "Connecting to $SUBDOMAIN.dev.red2green.net"
  cpln workload connect "$SUBDOMAIN" --location aws-us-east-1 --container red2green --shell sh --org red2green-dev --gvc red2green
}

function reinit() {
  source ~/.zshrc
}

r2g () {
  WORK_DIR="~/1000paces/git/ies-r2g"
  SESSION="r2g-processes"
  WORK_SESSION="ies-r2g"

  # PIDS=$(lsof -ti:3000)
  # if [[ -n "$PIDS" ]]; then
  #   kill -9 $PIDS
  # fi
  kill -9 $(lsof -ti:3000)

  tmux kill-session -t $SESSION 2>/dev/null
  tmux new-session -d -s $SESSION -c $WORK_DIR
  tmux split-window -h -t $SESSION:1.1
  tmux split-window -v -t $SESSION:1.2
  tmux split-window -v -t $SESSION:1.3
  tmux split-window -v -t $SESSION:1.4

  tmux send-keys -t $SESSION:1.1 "cd $WORK_DIR && rails s" ENTER
  tmux send-keys -t $SESSION:1.2 "cd $WORK_DIR && shakapacker-dev-server" ENTER
  tmux send-keys -t $SESSION:1.3 "cd $WORK_DIR && yarn codegen-watch" ENTER
  tmux send-keys -t $SESSION:1.4 "cd $WORK_DIR && bundle exec sidekiq" ENTER
  tmux send-keys -t $SESSION:1.5 "cd $WORK_DIR && ./elastic-start-local/start.sh" ENTER

  # tmux attach-session -t $SESSION
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t $SESSION
  else
    tmux attach-session -t $SESSION
  fi

  tmux kill-session -t $WORK_SESSION 2>/dev/null
  tmux new-session -d -s $WORK_SESSION -c $WORK_DIR
  tmux split-window -h -t $WORK_SESSION:1.1
  tmux split-window -v -t $WORK_SESSION:1.2
  tmux split-window -v -t $WORK_SESSION:1.1

  tmux send-keys -t $WORK_SESSION:1.1 "cd $WORK_DIR && rails c" ENTER
  # tmux send-keys -t $WORK_SESSION:1.2 "cd $WORK_DIR && claude" ENTER
  tmux send-keys -t $WORK_SESSION:1.3 "cd $WORK_DIR && pgcli ies_r2g_development" ENTER
  tmux send-keys -t $WORK_SESSION:1.4 "cd $WORK_DIR" ENTER
  tmux attach-session -t $WORK_SESSION
}


# Added by Antigravity
export PATH="/Users/rmiles/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval "$(rbenv init -)"

alias python=python3
