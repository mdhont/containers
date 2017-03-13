#!/bin/bash -e
. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page
check_for_updates &

if [ -f composer.json  ]; then
  composer install
fi

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/run-php-fpm.sh" ]]; then
  nami_initialize php
  chown -R :daemon /bitnami/php || true
fi

exec tini -- "$@"
