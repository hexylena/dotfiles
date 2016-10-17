# Path to your oh-my-zsh installation.
  export ZSH=/home/hxr/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hxr"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/hxr/.local/bin/:/home/hxr/.bin:/usr/local/texlive/2015/bin/x86_64-linux:/home/hxr/.sdkman/candidates/groovy/current/bin:/home/hxr/.sdkman/candidates/grails/current/bin:/home/hxr/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/hxr/.go/bin:/home/hxr/work/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sl='ls'
alias ll='ls -al'


export GOPATH=$HOME/work/go
export GOROOT=$HOME/.go
export PATH=$HOME/.local/bin/:/home/hxr/.linuxbrew/bin:$PATH:$GOROOT/bin:$GOPATH/bin

. /home/hxr/.ssh-sock
. /home/hxr/.gpg-sock

function logme(){
    sudo /home/hxr/work/go/bin/client --standalone
}

fg() {
    if [[ $# -eq 1 && $1 = -  ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}

bg() {
    if [[ $# -eq 1 && $1 = -  ]]; then
        builtin bg %-
    else
        builtin bg %"$@"
    fi
}

function keygen(){
    ssh-keygen -t rsa -b 4096 -f .ssh/keys/id_rsa_$1
}

function _sshload(){
    ssh-add $(find ~/.ssh/keys -not -name '*.pub' -type f)
}

function logme(){
    sudo /home/hxr/work/go/bin/client --standalone
}

function mirror(){
    vlc v4l2:///dev/video0
}

function jw(){
    tmp=$(mktemp)
    cat $1 | json_pp > $tmp;
    mv $tmp $1;
}

function yt(){
    youtube-dl -i -x $@
}

function vol(){
    amixer -D pulse sset Master $@
}

function volu(){
    amixer -D pulse sset Master 5%+
}
function vold(){
    amixer -D pulse sset Master 5%-
}

function docker_cleanup() {
    docker images | grep '<none' | awk '{print $3}' | xargs docker rmi;
    docker ps -a |grep -v 'Up' | awk '{print $1}' | xargs docker rm;
}

if [ -x /usr/games/cowsay -a -x /usr/games/fortune -a -x /usr/games/lolcat  ]; then
	fortune | cowsay -W 60
fi

function _haskell(){
	docker run -it -v `pwd`:/data haskell 'bash' -c 'cd /data; bash'
}

function _rust(){
	docker run -it -v `pwd`:/data schickling/rust 'bash' -c 'cd /data; bash'
}

# I know what I'm doing, thank you.
setopt rmstarsilent
setopt no_nomatch
# Feck off with huping my stuff.
setopt nohup
setopt no_check_jobs

export ANSIBLE_NOCOWS=1
#export SDKMAN_DIR="/home/hxr/.sdkman"
#[[ -s "/home/hxr/.sdkman/bin/sdkman-init.sh" ]] && source "/home/hxr/.sdkman/bin/sdkman-init.sh"
#. /home/hxr/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
. /home/hxr/.env.secret
