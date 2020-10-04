#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start
echo "Starting node ..."
node /opt/main.js
