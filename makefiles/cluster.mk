override COMPOSE_CLUSTER_NODE_FLAGS = --file docker/network.compose.yml --file docker/cluster.compose.yml

.PHONY: cluster-up
cluster-up: ## Starts a cluster ScyllaDB
	@$(DOCKER_COMMAND) compose $(COMPOSE_CLUSTER_NODE_FLAGS) up --detach

.PHONY: cluster-down
cluster-down: ## Remove the entire cluster with volumes from node
	@$(DOCKER_COMMAND) compose $(COMPOSE_CLUSTER_NODE_FLAGS) down --volumes

.PHONY: cluster-nt-status
cluster-nt-status: ## Shows node nodetool status
	@$(DOCKER_COMMAND) compose $(COMPOSE_CLUSTER_NODE_FLAGS) exec $(NODE) nodetool status

.PHONY: cluster-cqlsh
cluster-cqlsh: ## Enters node CQLSH
	@$(DOCKER_COMMAND) compose $(COMPOSE_CLUSTER_NODE_FLAGS) exec -it $(NODE) cqlsh

.PHONY: cluster-logs
cluster-logs: ## Shows cluster logs
	@$(DOCKER_COMMAND) compose $(COMPOSE_CLUSTER_NODE_FLAGS) logs --follow
