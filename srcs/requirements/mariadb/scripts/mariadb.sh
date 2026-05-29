#!/bin/bash

set -e

# attendre la creqtion de la DB
sleep 3

<<EOF>>

echo "lunching mariadb..."

exec "$@"