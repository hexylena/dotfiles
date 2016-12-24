TARGETS_IN:=$(sort $(dir $(wildcard */)))
TARGETS= $(TARGETS_IN:/=.x)
TARGETS:=$(filter-out media.x,$(TARGETS))

help:
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: $(TARGETS) ## Stow all folders

%.x:
	stow $(basename $@)

apt:  ## Install packages
	sudo apt install atop awesome byobu curl git-lfs keepassx \
	pavucontrol python-dev python-pip python-virtualenv scrot \
	secure-delete shutter stow wget xbacklight xdotool xscreensaver \
	xscreensaver-gl xscreensaver-gl-extra xscreensaver-data-extra xsel \
	zsh

/home/hxr/.spf13-vim-3: ## Install spf13-vim
	echo 'installing spf'
	#curl http://j.mp/spf13-vim3 -L -o - | sh

bootstrap: apt /home/hxr/.spf13-vim-3

.PHONY: apt bootstrap
