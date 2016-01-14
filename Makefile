TARGETS_IN:=$(sort $(dir $(wildcard */)))
TARGETS= $(TARGETS_IN:/=.x)

all: $(TARGETS)

%.x:
	stow $(basename $@)
