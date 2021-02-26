.PHONY := mix headers
.DEFAULT_GOAL := mix
PASHMAK = $(shell which pashmak)

headers:
	@$(PASHMAK) scripts/update-headers.pashm

test:
	@$(PASHMAK) tests/run.pashm

all: headers test
	-@git status
