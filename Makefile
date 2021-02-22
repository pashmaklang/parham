.PHONY := mix headers
.DEFAULT_GOAL := mix
PASHMAK = $(shell which pashmak)

mix:
	@mkdir -p dist
	@$(PASHMAK) @compiler parham/parham.pashm dist/parham.pashm
	@chmod +x dist/parham.pashm

headers:
	@$(PASHMAK) scripts/update-headers.pashm

test:
	@$(PASHMAK) tests/run.pashm

all: headers test
	-@git status
