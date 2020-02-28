# rosebud
A simple containerized Flask app used to publish articles.
It is meant to be a starting point for you to mold it to your needs.

## DONE:
-------

	* project file structure defined

	* DockerFile make builds the project

	* Project works with uWSGI internal web-server

## TODO:
-------

	* Buildah make builds the project

	* Buildah-scratch builds the project

	* Project works with NGINX web-server

	* Replace Place holder style with a bootstrap style

	* create artical class

	* Configure SELinux settings

	* Provide instructions for instillation on a base system

## Security

Considering that this project is intended to be shaped by who works with it the base level of security should be high.

While Rosebud uses a container as a means to limit the potential surface area of an attack containers do not provide the same security as a VM or a proper sandbox will provide.

In this case I am using a container as a way to compactly way to create a user who will have access to a very limited part of the host system.
Both of these things can be done with normal user creation and file permissions on a UNIX system.

If you wanted to go the extra mile then you can configure SELinux to limit the scope even further and provide reporting.

I am looking into this but currently I am quite in the dark about how SELinux works so I don't know if I will use it here.

Rosebud is intended to run in a container as a non root user and not have write permissions to it's program files.
This is so that if someone does make it in they will be contained and hopefully limit the amount of harm that they can do to your sight.

