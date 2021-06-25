#!/bin/bash

file_directory=`dirname $0`
pushd $file_directory

./pre_config.sh

pushd packages

for package in *; do
    echo "Running package $package"

    pushd $package
    ./install.sh
    popd #package

    echo "Done package $package"
done

popd # packages

./post_config.sh

popd # file_directory
