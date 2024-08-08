DOCKER_COMMAND := $(shell command -v docker 2> /dev/null)

ifndef DOCKER_COMMAND
$(error "Cannot find docker")
endif

include makefiles/Makefile.setup
include makefiles/Makefile.singlenode

.PHONY: help
help: ## Show the help commands
	@echo "Available commands:"
	@grep -E '^[^[:space:]]+:[^:]*?## .*$$' $(MAKEFILE_LIST) | \
	sed -e 's/^[^:]*://g' | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}' | \
	sort
