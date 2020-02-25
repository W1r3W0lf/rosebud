#! /bin/bash
echo "Starting Buildah Build"
set -x
rose=$(buildah from fedora:latest)
buildah run "$rose" -- dnf update -y
buildah run "$rose" -- dnf install python python-pip -y
