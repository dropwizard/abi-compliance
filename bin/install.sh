#!/bin/bash
set -euxo pipefail

INSTALLER_DIR='installer-4j'
INSTALLER_VERSION='0.5'

apt-get update --quiet
apt-get --no-install-recommends --quiet --assume-yes install \
	curl ca-certificates make file gawk binutils diffutils rfcdiff wdiff perl gnuplot

mkdir "${INSTALLER_DIR}"
curl -s -f -L "https://github.com/lvc/installer-4j/archive/refs/tags/${INSTALLER_VERSION}.tar.gz" | tar --strip-components 1 -C "${INSTALLER_DIR}" -xzvf -

pushd "${INSTALLER_DIR}"
for dep in japi-tracker japi-monitor japi-compliance-checker pkgdiff
do
	make install target="${dep}"
done
popd
rm -rf "${INSTALLER_DIR}"
