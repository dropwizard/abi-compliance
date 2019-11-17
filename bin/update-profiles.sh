#!/bin/bash
set -euxo pipefail

for profile in profiles/*.json
do
	japi-monitor -get -build-new "${profile}"
done
