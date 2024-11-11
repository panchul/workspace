#!/usr/bin/env bash

set -Eeuo pipefail

pushd .

# prereqs
sudo softwareupdate --install-rosetta --agree-to-license
brew install openjdk@17 

# TODO
# UNDER CONSTRUCTION!

flutter --version
fvm --version

popd

