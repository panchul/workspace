#!/usr/bin/env bash

pushd .

go get github.com/linkedin/Burrow
cd $GOPATH/src/github.com/linkedin/Burrow
gpm install
go install

popd

