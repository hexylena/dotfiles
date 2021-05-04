TARGETS_IN:=$(sort $(dir $(wildcard */)))
TARGETS= $(TARGETS_IN:/=.x)
TARGETS:=$(filter-out media.x,$(TARGETS))

help:
	@egrep '^[^ ]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

stow: $(TARGETS) ## Stow all folders

%.x:
	stow $(basename $@)

UNAME:=$(shell uname -m)


apt: # apt_docker apt_node ## Install packages
	sudo apt-get update --fix-missing
	sudo snap install spotify
	sudo snap install --classic slack
	sudo snap install zoom-client
	sudo apt install -q -y $$(cat packages.txt  | grep -v '^#' | paste -s)

/home/hxr/.bin/trans: ## Install translation tool
	curl -L git.io/trans -o $@
	chmod +x $@

/home/hxr/.spf13-vim-3: ## Install spf13-vim
	echo 'installing spf'
	#curl http://j.mp/spf13-vim3 -L -o - | sh

.PHONY: apt bootstrap fix-origin
