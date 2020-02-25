#! /bin/bash
echo "Starting Buildah Build"
set -x
rose=$(buildah from fedora:latest)
buildah run "$rose" -- dnf update -y
buildah run "$rose" -- dnf install python python-pip -y
buildah copy "$rose" -- ./requirements.txt /app/requirements.txt
buildah config --workingdir /app "$rose"
buildah copy "$rose" -- ./app /app
buildah run "$rose" -- pip install -r requirements.txt
buildah config --entrypoint '[ "/start.sh" ]' "$rose"
buildah run "$rose" -- chmod +x start.sh
