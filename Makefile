TARGETS_IN:=$(sort $(dir $(wildcard */)))
TARGETS= $(TARGETS_IN:/=.x)
TARGETS:=$(filter-out media.x,$(TARGETS))

help:
	@egrep '^[^ ]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

stow: $(TARGETS) ## Stow all folders

all: apt fix-origin /home/hxr/.bin/youtube-dl $(TARGETS) ## Install / update

%.x:
	stow $(basename $@)

UNAME:=$(shell uname -m)

apt_docker:
	@if [ ! -f /etc/apt/sources.list.d/docker.list ]; then \
		sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D; \
		echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list; \
		sudo apt update; \
	fi

apt_node:
	@if [ ! -f /etc/apt/sources.list.d/nodesource.list ]; then \
		curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - ; \
	fi

apt: apt_docker apt_node ## Install packages
	sudo apt-get update --fix-missing
	sudo apt-get install -q -y \
	acpitool agedu apache2-utils apt-transport-https aptitude arandr aria2 atop \
	awesome build-essential byobu ca-certificates cmake cowsay curl docker-engine \
	evince exifprobe exiftool fcrackzip fdupes ffmpeg figlet firefox fortune \
	fortunes-de fortunes-off fortunes-spam fortunes-ubuntu-server gdal-bin \
	ghostscript gimp git git-lfs gnuplot htop hyphen-no iftop imagemagick inkscape \
	inorwegian iotop jq keepassx language-pack-nb language-pack-nb-base \
	language-pack-nn libffi-dev libfreetype6-dev libjpeg62 libpng-dev libpq-dev \
	libreoffice-l10n-nb libreoffice-l10n-nn libsdl2-dev libsdl2-image-dev \
	libsdl2-mixer-dev libssl-dev libxml-xpath-perl mpd mpv mutt ncmpcpp nmap nodejs \
	okular openconnect openjdk-8-jre openssh-client openssh-server openvpn pandoc \
	pavucontrol pcmanfm pinentry-curses pm-utils postgresql-client-9.5 pv \
	python-dev python-pip python-virtualenv python3-dev python3-pip redshift \
	rtmpdump sakura screenfetch scrot secure-delete shotwell shutter spacefm stack \
	steam stow thunderbird tofrodos transmission-gtk unrar vim vlc wget wireshark \
	wnorwegian xbacklight xdotool xscreensaver xscreensaver-data-extra \
	xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod \
	xscreensaver-screensaver-dizzy xscreensaver-screensaver-webcollage xsel zsh \
	sqlite3 inetutils-traceroute
	sudo npm install -g yarn

update:
	sudo apt-get dist-upgrade
	sudo npm update -g yarn

/home/hxr/.bin/youtube-dl: # Install youtube-dl
	curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /home/hxr/.bin/youtube-dl
	chmod +x /home/hxr/.bin/youtube-dl

/home/hxr/.spf13-vim-3: ## Install spf13-vim
	echo 'installing spf'
	#curl http://j.mp/spf13-vim3 -L -o - | sh

fix-origin: ## Fix GIT origin
	git remote set-url origin git@github.com:erasche/dotfiles.git

bootstrap: apt /home/hxr/.spf13-vim-3

.PHONY: apt bootstrap fix-origin
