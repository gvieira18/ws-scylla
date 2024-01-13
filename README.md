# ws-scylla-docker

`TODO: Maybe someday I'll write a better README`

### Compose

```shell
docker compose up -d
```
### nodetool

```shell
docker exec -it ws-scylla-1 nodetool status
```
```shell
Datacenter: DC
==============
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address    Load       Tokens       Owns    Host ID                               Rack
UN  10.10.5.2  458.66 KB  256          ?       00000000-0000-0000-0000-000000000000  RACK
UN  10.10.5.3  453.15 KB  256          ?       00000000-0000-0000-0000-000000000000  RACK
UN  10.10.5.4  453.23 KB  256          ?       00000000-0000-0000-0000-000000000000  RACK
```
