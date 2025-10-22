# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export LANG="nl_NL.UTF8"
export LANGUAGE="nl_NL.UTF8"
export LC_ALL="nl_NL.UTF8"

# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TZ=Europe/Amsterdam

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="hxr"
DISABLE_AUTO_UPDATE="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"
export HISTTIMEFORMAT="%Y-%m-%d-%H-%M-%S "
export HISTSIZE=1000000001
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zsh_history
setopt append_history
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt histignorespace
export LESSHISTFILE=/dev/null
export XDG_CONFIG_HOME=/home/user/.config
REPORTTIME=4

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(history-substring-search fzf fzf-tab zoxide)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export EDITOR='nvim'
export TEXMFHOME='~/.texmf'
export PATH="$HOME/.local/bin:$HOME/bin/:$HOME/.pixi/bin:$PATH"
# The folders are too damn annoying.
export PYTHONDONTWRITEBYTECODE=1
export ANSIBLE_NOCOWS=1
export NOCOLOR=1
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export GPG_TTY=$BYOBU_TTY
export PGHOST=localhost
export PGUSER=postgres
export PGPASSWORD=postgres

export PERL5LIB="${HXR_PERL_HOME}/lib/perl5"
export PATH="${HXR_PERL_HOME}/bin:$PATH"
export PERL_LOCAL_LIB_ROOT="${HXR_PERL_HOME}:${PERL_LOCAL_LIB_ROOT}"
export PERL_MB_OPT="--install_base \"${HXR_PERL_HOME}\""
export PERL_MM_OPT="INSTALL_BASE=${HXR_PERL_HOME}";

export TERM=xterm-256color # 'screen' screws p home/end.
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring # https://github.com/pypa/pip/issues/7883 GO AWAY.
export GREP_COLORS='mt=1;37;4;40'
export TZ_LIST="Pacific/Auckland,Australia/Melbourne,Asia/Tokyo,Asia/Kolkata,Europe/London,US/Pacific,US/Central,US/Eastern,Pacific/Midway"

export MANPAGER='nvim +Man!' # Use nvim to go through the man pages, it's really nice tbh

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
alias sl='ls'
alias ll='ls -al'
alias s='ls -al'
alias k='ls'
alias ks='ls -al'
alias kr='ls -al --sort=t -r'
alias rm='rm -i'
alias mkae='make'
alias woman='man'
alias cear='clear'
alias ckear='clear'
alias byobu-attach='byobu attach -t '
alias byobu-att='byobu attach -t '
alias axe="awk '{print \$2}' | xargs kill"
alias mpv="mpv --no-audio-display"
alias qmv='qmv -fdo'
alias ploc='plocate -d ~/.cache/plocate.db'
alias tssh='SSH_AUTH_SOCK="" tailscale ssh'
alias xpq='xpath -q -e'
# alias gcam='git commit --all --message'
alias convert='magick convert'
alias vim=nvim
alias vimdiff='nvim -d'

#alias cat='lolcat -t'

# Needed for zsh to work like I expect.
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

# venv
function venv(){
	new_venv=0
	if [ ! -d '.venv' ]; then
		#virtualenv .venv -p $(which python3.7);
		python3 -mvenv .venv
		new_venv=1
	fi

	. .venv/bin/activate

	if [ -e 'requirements.txt' ]; then
		venv_age=$(stat -c %Y .venv)
		reqs_age=$(stat -c %Y requirements.txt)
		if (( new_venv == 1 )) || (( reqs_age > venv_age )); then
			pip install -r requirements.txt;
		fi
	fi

	if (( $# > 0 )); then
		pip install $@;
	fi
}

function venv2(){
	if [ ! -d '.venv2' ];
	then
		python2.7 -m virtualenv .venv
	fi

	. .venv2/bin/activate  # commented out by conda initialize  # commented out by conda initialize

	if [ -e 'requirements.txt' ];
	then
		venv_age=$(stat -c %Y .venv2)
		reqs_age=$(stat -c %Y requirements.txt)
		if (( reqs_age > venv_age )); then
			pip install -r requirements.txt;
		fi
	fi
}

# I know what I'm doing, thank you.
setopt rmstarsilent
setopt no_nomatch
# Feck off with huping my stuff.
setopt nohup
setopt no_check_jobs

ossec(){
	if (( $# == 0 )); then
		echo "Current: ${_OSSEC:-none}"
		echo
		find ~/Personal/secrets/env.secret.* | sed 's/.*env.secret./  /g'
		echo
		echo "ossec clear - wipes out vars."
		return
	fi

	# TODO: support multiple
	if [[ $1 == "clear" ]]; then
		if [[ -n "$_OSSEC" ]]; then
			$(cat ~/Personal/secrets/env.secret.ansible | sed 's/export/unset/g;s/=.*//g')
			export _OSSEC=""
		else
			echo "No currently active environment(s)"
		fi
		return
	fi

	# And set some new ones
	source ~/Personal/secrets/env.secret.$1

	if [[ -n "$_OSSEC" ]]; then
		export _OSSEC="$_OSSEC:$1"
	else
		export _OSSEC=$1
	fi
}

#pgrep syndaemon > /dev/null || syndaemon -i 1 -d -K &
#de.py

activate-nvm() {
	export NVM_DIR="$HOME/.config/nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function rvm {
	unset -f rvm

	# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
	export PATH="$HOME/.rvm/bin:$PATH:$HOME/.rvm/bin"
	source $HOME/.rvm/scripts/rvm

	rvm "${@}"
}

function circos {
	unset -f circos
	export PATH=$(find ~/arbeit/circos/circos-tools-0.22/tools/*/bin -maxdepth 0 | paste -s -d:):$PATH

	# find latest circos
	latest=$(find ~/arbeit/circos/ -maxdepth 1 -name 'circos-[0-9.-]*' -type d | sort | tail -n 1)
	echo "Activating $latest"
	export PATH="$latest/bin:$PATH"
	circos "${@}"
}

activate-go(){
	[[ -s "/home/user/.gvm/scripts/gvm" ]] && source "/home/user/.gvm/scripts/gvm"
}

activate-rust() {
	source $HOME/.cargo/env
}

cdt() {
	if [[ $# -gt 0 ]]; then
		cd `mktemp -d /tmp/$1.XXXXXXXXXX`
	else
		cd `mktemp -d`
	fi
}

eval "$(direnv hook zsh)"
# . /usr/share/fzf/shell/key-bindings.zsh

# export FZF_DEFAULT_OPTS="--reverse --walker=file,dir,follow --scheme=path -m --color=fg:#000000,bg:#ffffff,hl:#0000ff,fg+:#ffffff,bg+:#000000,hl+:#ffff00"
# FZF_DEFAULT_OPTS=$(__fzf_defaults "--reverse --walker=file,dir,follow,hidden --scheme=path" "${FZF_CTRL_T_OPTS-} -m")

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=fg:#000000,bg:#ffffff,hl:#0000ff,fg+:#ffffff,bg+:#000000,hl+:#ffff00"
export FZF_CTRL_T_OPTS="--walker file,dir,follow"
# Faster CD
alias cd='z'
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'


export HISTSIZE=10000000
export SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.


# ATUIN
eval "$(atuin init zsh  --disable-up-arrow)"

export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket;

# SPLIT SSH CONFIGURATION >>>
# replace "vault" with your AppVM name which stores the ssh private key(s)
SSH_VAULT_VM="vault-ssh"

if [ "$SSH_VAULT_VM" != "" ]; then
  export SSH_AUTH_SOCK="/home/user/.SSH_AGENT_$SSH_VAULT_VM"
fi
export SHELL=/usr/bin/zsh
# export LS_COLORS="di=1;31:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';
export LS_COLORS


# zprof

# Be more conservative about what filenames we render.
#export LC_ALL=C
export PATH="/home/user/.pixi/bin:$PATH"
export TMP=~/TMP TEMP=~/TMP TMPDIR=~/TMP
