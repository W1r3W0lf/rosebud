#! /bin/bash
echo "Starting Buildah Build"
set -x
rose=$(buildah from fedora:31)
