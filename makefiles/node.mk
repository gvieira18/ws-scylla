override COMPOSE_SINGLE_NODE_FLAGS = --file docker/network.compose.yml --file docker/node.compose.yml

.PHONY: node-up
node-up: ## Starts a node ScyllaDB
	@$(DOCKER_COMMAND) compose $(COMPOSE_SINGLE_NODE_FLAGS) up --detach

.PHONY: node-down
node-down: ## Remove the entire container with volumes from node
	@$(DOCKER_COMMAND) compose $(COMPOSE_SINGLE_NODE_FLAGS) down --volumes

.PHONY: node-nt-status
node-nt-status: ## Shows node nodetool status
	@$(DOCKER_COMMAND) compose $(COMPOSE_SINGLE_NODE_FLAGS) exec $(NODE) nodetool status

.PHONY: node-cqlsh
node-cqlsh: ## Enters node CQLSH
	@$(DOCKER_COMMAND) compose $(COMPOSE_SINGLE_NODE_FLAGS) exec -it $(NODE) cqlsh
