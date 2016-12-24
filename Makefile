TARGETS_IN:=$(sort $(dir $(wildcard */)))
TARGETS= $(TARGETS_IN:/=.x)
TARGETS:=$(filter-out media.x,$(TARGETS))

help:
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

all: apt fix-origin $(TARGETS) ## Stow all folders

%.x:
	stow $(basename $@)

UNAME:=$(shell uname -m)
pre_apt: ## Repositories for use in APT
	@if [ ! -f /etc/apt/sources.list.d/docker.list ]; then \
		sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D; \
		echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list; \
		sudo apt update; \
	fi

apt: pre_apt ## Install packages
	sudo apt-get install -q -y atop awesome byobu curl git-lfs keepassx \
	pavucontrol python-dev python-pip python-virtualenv scrot \
	secure-delete shutter stow wget xbacklight xdotool xscreensaver \
	xscreensaver-gl xscreensaver-gl-extra xscreensaver-data-extra xsel \
	zsh build-essential libsdl2-dev apt-transport-https ca-certificates \
	docker-engine

/home/hxr/.spf13-vim-3: ## Install spf13-vim
	echo 'installing spf'
	#curl http://j.mp/spf13-vim3 -L -o - | sh

fix-origin: ## Fix GIT origin
	git remote set-url origin git@github.com:erasche/dotfiles.git

bootstrap: apt /home/hxr/.spf13-vim-3

.PHONY: apt bootstrap fix-origin
