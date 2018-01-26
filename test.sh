#!/bin/sh


PKGS="$(find Formula -iname "*.rb" -exec sh -c 'FORMULA={}; basename ${FORMULA%.*}' \;)"

for pkg in ${PKGS}; do
	brew install --HEAD $pkg --verbose
	brew test $pkg
	brew uninstall --force $pkg
done

RELEASED=linuxkit

for pkg in ${RELEASED}; do
	brew install $pkg --verbose
	brew audit $pkg --strict
	brew test $pkg
	brew uninstall --force $pkg
done
