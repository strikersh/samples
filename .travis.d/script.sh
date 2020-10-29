#!/usr/bin/env bash

set -e

if [ -n "$AUTH" ]; then
	AUTH="--auth $AUTH"
fi

git clone --depth=1 https://github.com/DolceSDK/ddpm.git
python3 ddpm/dolcesdk-update.py $AUTH
rm -rf ddpm
dolcesdk-update-packages $AUTH
cmake .
make # use only 1 job to avoid race condition
