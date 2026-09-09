#!/bin/sh
set -e

echo "Waiting for Vault Agent to produce secrets..."
while [ ! -f /vault/agent/secrets.env ]; do
  sleep 1
done

export $(grep -v '^#' /vault/agent/secrets.env | xargs)

exec gunicorn -b 0.0.0.0:5000 app:app
