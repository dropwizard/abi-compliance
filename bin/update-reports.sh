#!/bin/bash
set -euxo pipefail

BUILD_DIR="${BUILD_DIR:-public}"
mkdir -p "${BUILD_DIR}/json"

for profile in profiles/*.json
do
	japi-tracker -build -global-index -rss -deploy "${BUILD_DIR}" "${profile}"
	japi-tracker -json-report "${BUILD_DIR}/json" -deploy "${BUILD_DIR}" "${profile}"
done
mv index.html "${BUILD_DIR}"
