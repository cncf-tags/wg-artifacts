TOP_LEVEL=$(shell git rev-parse --show-toplevel)
TMPDIR := $(shell mktemp -d)
TOOLSDIR := $(shell pwd)/hack/tools
SHELL = /bin/bash
BATS := $(TOOLSDIR)/bin/bats
BATS_FLAGS = --verbose-run --show-output-of-passing-tests --print-output-on-failure

.PHONY: all
all: conformance

$(BATS):
	pushd $(TMPDIR); \
	git clone https://github.com/bats-core/bats-core.git; \
	cd bats-core; ./install.sh $(TOOLSDIR); \
	popd

.PHONY: conformance
conformance: $(BATS)
	$(BATS) $(BATS_FLAGS) tests/conformance.bats

.PHONY: clean
clean:
	rm -rf $(TOOLSDIR)
	rm -rf $(TMPDIR)
