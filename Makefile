.PHONY := mix
.DEFAULT_GOAL := mix
PASHMAK = $(shell which pashmak)

mix:
	@mkdir -p dist
	@$(PASHMAK) @compiler parham/parham.pashm dist/parham.pashm
	@chmod +x dist/parham.pashm
