# ws-scylla

### Overview

This project simplifies ScyllaDB cluster configuration with 3 nodes for local testing using Docker and Docker Compose. It facilitates easy deployment and testing of ScyllaDB, a highly scalable NoSQL database.

### Prerequisites

Before you begin, make sure the following software is installed on your system:

- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker Compose](https://docs.docker.com/compose/install/linux/)

### Getting Started

1. **Clone this repository:**

```bash
git clone https://github.com/gvieira18/ws-scylla.git
```

2. **Configure ScyllaDB settings:**

   - Before starting the cluster, ensure the [aio-max-nr](https://www.kernel.org/doc/Documentation/sysctl/fs.txt) value is sufficient (e.g., `1048576` or more). Check and adjust the value with the following commands:
     ```bash
     cat /proc/sys/fs/aio-max-nr
     ```
     ```bash
     echo fs.aio-max-nr=1048576 | sudo tee /etc/sysctl.d/41-aio_max_nr.conf && sudo sysctl --system
     ```
     > [!NOTE] This command adds a file inside the `/etc/sysctl.d` folder for startup loading.
   - [Optional] Modify the `docker-compose.yml` file to customize ScyllaDB settings, such as port mappings, volume mounts, and network configurations.

3. **Start the ScyllaDB container:**

Use the following command to pull the ScyllaDB Docker image (if not already downloaded) and start the container in the background:

```bash
docker compose up --detach # or docker compose up -d
```

### Maintenance

#### Accessing the Database

- **CQLSH (Cassandra Query Language Shell):**

```bash
docker compose exec -it ws-scylla-1 cqlsh
# or
docker compose exec -it ws-scylla-2 cqlsh
# or
docker compose exec -it ws-scylla-3 cqlsh
```

CQLSH is the command-line interface for interacting with ScyllaDB using the Cassandra Query Language (CQL). It allows you to execute CQL queries and manage the database.

- **Nodetool:**

```bash
docker compose exec -it ws-scylla-1 nodetool status
# or
docker compose exec -it ws-scylla-2 nodetool status
# or
docker compose exec -it ws-scylla-3 nodetool status
```

Nodetool is a command-line utility for managing and monitoring ScyllaDB clusters. It provides various operations, such as checking the status of nodes, compaction, repair, and more.

- **Inside the Docker Network:**

The `docker-compose.yml` file defines a specific network (`ws-scylla`) for internal usage. Integration with other projects within different Docker Compose specifications is possible.

```yml
services:
  custom-service:
    networks:
      - ws-scylla
networks:
  ws-scylla:
    external: true
```

After starting the custom service, it registers within the `ws-scylla` network. The ScyllaDB configuration already defines default ports for access.

| Service Name |    Host     | Port |
| ------------ | :---------: | :--: |
| ws-scylla-1  | ws-scylla-1 | 9042 |
| ws-scylla-2  | ws-scylla-2 | 9042 |
| ws-scylla-3  | ws-scylla-3 | 9042 |

```js
const client = new cassandra.Client({
  contactPoints: ['ws-scylla-1:9042', 'ws-scylla-2:9042', 'ws-scylla-3:9042'],
  localDataCenter: 'datacenter1',
  keyspace: 'system'
});
```

- **Outside the Docker Network:**

The default `docker-compose.yml` file enables the following ports for external access to the DBMS/SGDB or directly to the database driver:

| Service Name |   Host    | Port |
| ------------ | :-------: | :--: |
| ws-scylla-1  | localhost | 9040 |
| ws-scylla-2  | localhost | 9041 |
| ws-scylla-3  | localhost | 9042 |

Using the same example from internal access:

```js
const client = new cassandra.Client({
  contactPoints: ['localhost:9040', 'localhost:9041', 'localhost:9042'],
  localDataCenter: 'datacenter1',
  keyspace: 'system'
});
```

Access via Datagrip, which belongs to IntelliJ, follows the JDBC standard. You can build the JDBC URL as follows:

```properties
URL="jdbc:cassandra://localhost:9040,localhost:9041,localhost:9042/system"
```

#### Backup and Restore the Database

TODO

#### Stop and Remove Cluster/Container

- **Stop the Cluster:**

```bash
docker compose stop
```

- **Stop and Remove Containers:**

```bash
docker compose down
```

> [!CAUTION] Removing the volume also means removing any information stored in the database, so proceed with caution and make a backup if necessary.

```bash
docker compose down --volumes # or docker compose down -v
```

### License

This project is licensed under the [MIT License](LICENSE).
