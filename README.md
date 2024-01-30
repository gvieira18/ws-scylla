# ws-scylla

## Overview

This project provides a simple ScyllaDB cluster configuration with 3 nodes for testing in a local environment using Docker and Docker Compose. The setup allows for easy deployment and testing of ScyllaDB, a highly scalable NoSQL database.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker Compose](https://docs.docker.com/compose/install/linux/)

## Getting Started

1. Clone this repository:

```bash
git clone https://github.com/gvieira18/ws-scylla.git
```

2. Configure ScyllaDB settings (optional):

Modify the `docker-compose.yml` file to customize ScyllaDB settings such as port mappings, volume mounts, etc.

3. Start the ScyllaDB container:

> This command will pull the ScyllaDB Docker image (if not already downloaded) and start the container in the background.

```bash
docker compose up --detach # or docker compose up -d
```

## Maintenance

### Stop and remove cluster/container

```bash
# Just stopping the cluster
docker compose stop
```

```bash
# Stopping the cluster and removing the containers
docker compose down
```

> [!CAUTION]
> Removing the volume also means removing any information stored in the database, so proceed with caution and make a backup if necessary.

```bash
# Stopping the cluster, removing containers and volumes
docker compose down --volumes # or docker compose down -v
```

## License

This project is licensed under the [MIT License](LICENSE).
