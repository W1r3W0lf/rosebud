Dockerfile.out:
	podman image build -t wire_wolf/rosebud .

Buildah:
	./buildahfile.sh

Scratch:
	./buildahfile-Scratch.sh

clean:
	podman image rm localhost/wire_wolf/rosebud
