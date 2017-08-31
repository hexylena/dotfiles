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
alias byobu_attach='byobu attach -t '
alias byobu_new='byobu new -s'
alias makep='make -f ~/dotfiles/oh-my-zsh/Makefile -f Makefile'


export GOPATH=$HOME/arbeit/go
export GOROOT=$HOME/.go
export PATH=$HOME/.local/bin/:/home/hxr/.linuxbrew/bin:$PATH:$GOROOT/bin:$GOPATH/bin

. /home/hxr/.ssh-sock

function logme(){
	sudo /home/hxr/work/go/bin/client --standalone;
	# When we exit, please date so we know how much time we're missing.
	date
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

function xw(){
    tmp=$(mktemp)
    cat $1 | xmllint --pretty 1 - > $tmp;
    mv $tmp $1;
}

function jw(){
    tmp=$(mktemp)
    cat $1 | jq -S '.' > $tmp;
    mv $tmp $1;
}

function yt(){
    youtube-dl -i -x --embed-thumbnail $@
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
    docker images | grep '<none' | awk '{print $3}' | xargs --no-run-if-empty docker rmi;
	docker ps -a |grep -v 'Up' | awk '(NR>1){print $1}' | xargs --no-run-if-empty docker rm;
}

if [ -x /usr/games/cowsay -a -x /usr/games/fortune -a -x /usr/games/lolcat  ]; then
	fortune | cowsay -W 60
fi

function alog(){
	user_description=$(echo "-$1 $2 $3 $4 $5 $6 $7 $8 $9" | sed 's/\s*$//g;s/ /_/g;s/[^A-Za-z0-9_-]//g')
	name=$(date "+%Y-%m-%dT%H:%M")"$user_description".mp3
	echo "Saving to $name"
	arecord -f cd -t raw | lame -x -r - $name
}

alias travis='docker run --rm -it -v $PWD:/repo -v ~/.travis:/travis travis'
function venv(){
	if [ ! -d '.venv' ];
	then
		virtualenv .venv -p $(which python3);
	fi

	. .venv/bin/activate

	if [ -e 'requirements.txt' ];
	then
		pip install -r requirements.txt;
	fi
}

function venv2(){
	if [ ! -d '.venv2' ];
	then
		virtualenv .venv2 -p $(which python2.7);
	fi
	. .venv2/bin/activate

	if [ -e 'requirements.txt' ];
	then
		pip install -r requirements.txt;
	fi
}

function ignore(){
	curl https://www.gitignore.io/api/$1 >> .gitignore;
	git add .gitignore;
}
function ignore_commit(){
	curl https://www.gitignore.io/api/$1 >> .gitignore;
	git add .gitignore;
	git commit -m 'Added gitignore';
}

function license(){
	cp /usr/share/R/share/licenses/$1 LICENSE;
	git add LICENSE;
	git commit -m 'Added LICENSE';
}

function testUtf8(){
	curl http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt;
}

alias -g gzc='gzip | base64 | xsel -b'
alias -g gzd='xsel -b | base64 -d | gzip -d'

function activateConda(){
	export PATH=/opt/miniconda3/bin:$PATH
}

function krup(){
	docker-compose kill $1;
	docker-compose rm -f $1;
	docker-compose up -d $1;
}

function jsfmt(){
	eslint --fix -c ~/.eslintrc $1
}

function pipi(){
	pip install $1;
	echo $1 >> requirements.txt;
}

function pipfreeze(){
	tmpfile=$(mktemp);
	pip freeze | grep -f requirements.txt > $tmpfile;
	mv $tmpfile requirements.txt;
}

function aqr(){
	tmpfile=$(mktemp --suffix .png)
	qrencode -s 6 -m 2 -lH -o $tmpfile $1
	feh $tmpfile
	rm -f $tmpfile
}

function y2j(){
	python -c 'import sys; import yaml; import json; sys.stdout.write(json.dumps(yaml.load(sys.stdin), indent=2))' < $1
}

# I know what I'm doing, thank you.
setopt rmstarsilent
setopt no_nomatch
# Feck off with huping my stuff.
setopt nohup
setopt no_check_jobs
# The folders are too damn annoying.
export PYTHONDONTWRITEBYTECODE=1

export ANSIBLE_NOCOWS=1
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
#export SDKMAN_DIR="/home/hxr/.sdkman"
#[[ -s "/home/hxr/.sdkman/bin/sdkman-init.sh" ]] && source "/home/hxr/.sdkman/bin/sdkman-init.sh"
#. /home/hxr/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
. /home/hxr/.env.secret
export PATH="$HOME/.cargo/bin:$PATH"
export GPG_TTY=$BYOBU_TTY
