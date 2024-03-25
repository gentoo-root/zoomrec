#!/bin/sh

set -e

: ${GITHUB_USERNAME:=gentoo-root}
: ${DOMAIN:=zoom.example.com}

PASSWORD_USER="$(pwgen -s 20)"
PASSWORD_DATABASE="$(pwgen -s 20)"

sed \
	-e "s#@@GITHUB_USERNAME@@#${GITHUB_USERNAME}#g" \
	-e "s#@@DOMAIN@@#${DOMAIN}#g" \
	-e "s#@@PASSWORD_USER@@#${PASSWORD_USER}#g" \
	-e "s#@@PASSWORD_DATABASE@@#${PASSWORD_DATABASE}#g" \
	cloud-init.yaml.in > cloud-init.yaml
