#!/usr/bin/env bash

set -ev

case $SUITE in
chefspec)
  rspec
  ;;
lint)
  foodcritic --context .
  rubocop --lint --display-style-guide --extra-details --display-cop-names
  ;;
*)
  KITCHEN_LOCAL_YAML='.kitchen.docker.yml' kitchen test "$SUITE" --log-level=debug
  ;;
esac
