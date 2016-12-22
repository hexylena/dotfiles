TARGETS_IN:=$(sort $(dir $(wildcard */)))
TARGETS= $(TARGETS_IN:/=.x)
TARGETS:=$(filter-out media,$(TARGETS))

all: $(TARGETS)

%.x:
	stow $(basename $@)
