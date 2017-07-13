#!/bin/sh


PKGS="$(find Formula -iname "*.rb" -exec sh -c 'FORMULA={}; basename ${FORMULA%.*}' \;)"

for pkg in ${PKGS}; do
	brew install --HEAD $pkg --verbose
	# Skip audit until we have a stable download
	# brew audit $pkg --strict
	brew test $pkg
done
