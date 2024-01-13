FROM scylladb/scylla:5.4.1

ARG CASSANDRA_DC="DC"
ARG CASSANDRA_RACK="RACK"
ARG CASSANDRA_ENDPOINT_SNITCH="GossipingPropertyFileSnitch"

ENV TZ="America/Sao_Paulo" SCYLLA_JMX_ADDR="-ja 0.0.0.0" SCYLLA_JMX_REMOTE="-r"

RUN set -xeu;\
  apt-get update;\
  apt-get install -y nano ca-certificates tzdata;\
  apt-get clean;

RUN set -xeu;\
  ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime;\
  echo ${TZ} > /etc/timezone;\
  dpkg-reconfigure tzdata -f noninteractive;

RUN set -xeu;\
  echo "dc=${CASSANDRA_DC}" >> /etc/scylla/cassandra-rackdc.properties;\
  echo "rack=${CASSANDRA_RACK}" >> /etc/scylla/cassandra-rackdc.properties;\
  echo "prefer_local=true" >> /etc/scylla/cassandra-rackdc.properties

RUN set -xeu;\
  sed -i "s/endpoint_snitch: SimpleSnitch/endpoint_snitch: ${CASSANDRA_ENDPOINT_SNITCH}/g" /etc/scylla/scylla.yaml;
