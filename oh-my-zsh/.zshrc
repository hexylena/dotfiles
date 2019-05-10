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
export HISTTIMEFORMAT="%Y-%m-%d-%H-%M-%S "
export HISTSIZE=5000000000
export SAVEHIST=${HISTSIZE}
export HISTFILE=~/.zsh_history
setopt append_history
setopt extended_history
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_ignore_dups
setopt histignorespace
setopt share_history
setopt inc_append_history
export LESSHISTFILE=/dev/null
export XDG_CONFIG_HOME=/home/hxr/.config

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/hxr/.local/bin/:/home/hxr/.bin:/usr/local/texlive/2015/bin/x86_64-linux:/home/hxr/.sdkman/candidates/groovy/current/bin:/home/hxr/.sdkman/candidates/grails/current/bin:/home/hxr/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/hxr/arbeit/go-src/bin:/home/hxr/work/go/bin"
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
alias qmv='qmv -fdo'
alias cat='lolcat -t'


export GOPATH=$HOME/arbeit/go
export GOROOT=$HOME/arbeit/go-src
export PATH=$HOME/.local/bin/:/home/hxr/.linuxbrew/bin:$PATH:$GOROOT/bin:$GOPATH/bin

#. /home/hxr/.ssh-sock

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
    ssh-keygen -t rsa -b 4096 -f /home/hxr/.ssh/keys/id_rsa_$1
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
    cat "$1" | xmllint --pretty 1 - | sponge "$1"
}

function jw(){
    cat "$1" | jq -S '.' | sponge > "$1";
}

function yt(){
    youtube-dl -i -x --audio-format mp3 $@
}

function ytp(){
    youtube-dl -i -x --audio-format mp3 -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' $@
}

function vol(){
    amixer -D pulse sset Master $@
}

function volu(){
    increment="5%"
	val=$(amixer -D pulse sget Master | grep '\[[0-9]*%\]' -o | sort -u | tr -d '[]%')
	if (( $val < 30 )){
		increment="2%"
	}
    amixer -D pulse sset Master $increment+
}
function vold(){
    increment="5%"
	val=$(amixer -D pulse sget Master | grep '\[[0-9]*%\]' -o | sort -u | tr -d '[]%')
	if (( $val < 30 )){
		increment="2%"
	}
    amixer -D pulse sset Master $increment-
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

	if (( $# > 0 )); then
		pip install $@;
	fi
}

function indexify() {
	if (( $# == 0 )); then
		echo "indexify '*jpg' (find name filter)"
	fi
	find . -name "$1" | awk '{print "<img src="$0" height=300/>"}' > index.html
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
	wanted="/usr/share/R/share/licenses/$1"
	if [[ -f $wanted ]]; then
		cp $wanted LICENSE;
		git add LICENSE;
		git commit -m 'Added LICENSE';
	else
		echo "Unknown license. Choose from"
		ls /usr/share/R/share/licenses
	fi
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
	pip install $1 && echo $1 >> requirements.txt;
	pipfreeze
}

function pipfreeze(){
	tmpfile=$(mktemp);
	unpinned_reqs=$(mktemp);
	cat requirements.txt| sed 's/==.*//' > $unpinned_reqs;
	pip freeze | grep -i -f $unpinned_reqs | sort > $tmpfile;
	rm -f $unpinned_reqs
	mv $tmpfile requirements.txt;
}

function aqr(){
	tmpfile=$(mktemp --suffix .png)
	qrencode -s 6 -m 2 -lH -o $tmpfile $1
	feh $tmpfile
	rm -f $tmpfile
}

function y2j(){
	python -c 'import sys; import yaml; import json; [sys.stdout.write(json.dumps(doc, indent=2)) for doc in yaml.load_all(sys.stdin)]'
}

function y2js(){
	python -c 'import sys; import yaml; import json; sys.stdout.write(json.dumps(yaml.safe_load(sys.stdin), indent=2))'
}

function j2y(){
	python -c 'import sys; import yaml; import json; yaml.dump(json.load(sys.stdin), sys.stdout)'
}
function j2y(){
	python -c 'import sys; import yaml; import json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, indent=2, default_flow_style=False)'
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
. /home/hxr/Personal/secrets/env.secret
export GPG_TTY=$BYOBU_TTY
export R_LIBS_USER=/home/hxr/arbeit/R/x86_64-pc-linux-gnu-library/3.2

function activate_conda(){
	# by default this takes over the default python installation. I do NOT want
	# this. It's bad news bears.
	# added by Miniconda3 4.3.21 installer
	export PATH="/home/hxr/arbeit/conda/bin:$PATH"
}

function random_mac_and_reconnect(){
	nmcli connection down $1;
	nmcli connection modify $1 wifi.cloned-mac-address 00:$(openssl rand -hex 5 | sed 's/\([0-9a-f][0-9a-f]\)/\1:/g;s/:$//');
	nmcli connection up $1;
}

function cdt(){
	if [[ $# -gt 0 ]]; then
		cd `mktemp -d /tmp/$1.XXXXXXXXXX`
	else
		cd `mktemp -d`
	fi
}
alias cda='cd ~/arbeit'

function set_brightness() {
	sudo tee $1 | /sys/class/backlight/intel_backlight/brightness
}
alias woman='man'

function audio_loopback() {

	if [ -z "$(pactl list short modules | grep module-loopback)"  ]; then
		pactl load-module module-loopback latency_msec=1
	else
		pactl unload-module module-loopback
	fi
}
alias axe="awk '{print \$2}' | xargs kill"
alias mpv="mpv --no-audio-display"

function wfdef() {
	curl "https://www.mindsportsacademy.com/api/Wordcheck/CheckWord/$1" --compressed
}

function wfchk(){
	grep '^'$1'$' /home/hxr/Personal/projects/sowpods/sowpods.txt
}

function wflen(){
	awk '(length <= '$1'){ print $0 }'
}

ossec(){
	if (( $# == 0 )); then
        opts_a=$(grep OS_PASSWORD=${OS_PASSWORD:-no-match} ~/Personal/secrets/env.secret* -l)
        opts_b=$(grep OS_AUTH_URL=${OS_AUTH_URL:-no-match} ~/Personal/secrets/env.secret* -l)
        match=$(join <(echo "$opts_a") <(echo "$opts_b") | sed 's|/home/hxr/Personal/secrets/env.secret.cloud-||g')

        echo "Current: $match"
        echo
		echo "Options:"
		for x in $(find /home/hxr/Personal/secrets/env.secret.cloud-*); do
			echo " "$(basename $x | cut -c 18-);
		done;
		return
	fi

	if [[ $1 == "add" ]]; then
		if (( $# < 2 )); then
			echo "ossec add <name>"
			return
		fi

		vim /home/hxr/Personal/secrets/env.secret.cloud-$2
		return
	elif [[ $1 == "clear" ]]; then
		for x in $(env | grep OS | awk -F= '{print $1}'); do unset $x; done;
		return
	fi

	# Unset any existing OS env vars
	for x in $(env | grep OS | awk -F= '{print $1}'); do unset $x; done;
	# And set some new ones
	source /home/hxr/Personal/secrets/env.secret.cloud-$1
}

function rz(){
	if (( $# > 0 )); then
		jrnl rz now: "$@"
	else
		jrnl rz
	fi
}

function inf(){
	if (( $# > 0 )); then
		jrnl inf now: "$@"
	else
		jrnl inf
	fi
}

function mountraw(){
	if (( $# != 2 )); then
		echo "mountraw img.raw /path"
	else
		mount -o loop,offset=$(( 512 * $(fdisk -lu | awk '/Linux/ {} END {print $3}') )) $1 $2
	fi
}

wallpaper() {
	if [[ ! -f "$@" ]]; then
		echo "not existing"
	else
		rm -f /home/hxr/.wallpaper.jpg
		ln -s "$(readlink -f "$@")" /home/hxr/.wallpaper.jpg
	fi
}

shutter_session(){
	SHUTTER_PID=$(ps aux | grep 'perl /usr/bin/shutter -s' | grep -v grep | awk '{print $2}')
	kill ${SHUTTER_PID}
	shutter &
}


weer(){
	if (( $(tput cols) < 125 )); then
		curl "https://wttr.in/${1:-Freiburg}?m&T&n"
	else
		curl "https://wttr.in/${1:-Freiburg}?m&T"
	fi
}

#pgrep syndaemon > /dev/null || syndaemon -i 1 -d -K &
#de.py

# added by travis gem
[ -f /home/hxr/.travis/travis.sh ] && source /home/hxr/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PGHOST=localhost
export PGUSER=postgres
export PGPASSWORD=postgres
activate-circos() {
	source /home/hxr/arbeit/galaxy/database/dependencies/_conda/envs/mulled-v1-03d8bba2abf2f466430f4512e06848dc70f8b3761e5e8e4f6b98e71e98b5a313/bin/activate mulled-v1-03d8bba2abf2f466430f4512e06848dc70f8b3761e5e8e4f6b98e71e98b5a313
	export PS1="(circos-conda)$CONDA_PS1_BACKUP"
}
