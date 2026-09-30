#!/bin/sh

set -e

PORT="${PORT:-8008}"

mkdir -p /opt/nezha/data

if [ ! -f /opt/nezha/data/config.yaml ]; then
    cat > /opt/nezha/data/config.yaml <<EOF
debug: false
listen_port: ${PORT}
language: zh_CN
jwt_secret_key: $(cat /proc/sys/kernel/random/uuid | tr -d '-')
agent_secret_key: $(cat /proc/sys/kernel/random/uuid | tr -d '-')
site:
  brand: Nezha Monitoring
EOF
fi

exec /opt/nezha/nezha-dashboard \
    -c /opt/nezha/data/config.yaml
