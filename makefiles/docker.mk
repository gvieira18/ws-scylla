.PHONY: stats
stats: ## Enter on docker compose stats
	@$(DOCKER_COMMAND) compose stats

.PHONY: status
status: ## Show docker status on format "ID NAME STATE IMAGE STATUS PORTS"
	@$(DOCKER_COMMAND) ps --format='table {{.ID}}\t{{.Names}}\t{{.State}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'

.PHONY: nodetool
nodetool: ## Shows current nodetool status - HARD CODED TO scylla-1
	@$(DOCKER_COMMAND) exec scylla-1 nodetool status

.PHONY: n
n: nodetool ## alias for "make nodetool"

.PHONY: cqlsh
cqlsh: ## Enters current cqlsh - HARD CODED TO scylla-1
	@$(DOCKER_COMMAND) exec -it scylla-1 cqlsh

.PHONY: c
c: cqlsh ## alias for "make cqlsh"
