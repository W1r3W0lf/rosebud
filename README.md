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

## Security

Considering that this project is intended to be shaped by who works with it the base level of security should be high.

Rosebud is intended to run in a container as a non root user and not have write permissions to it's program files.
This is so that if someone does make it in they will be contained and hopefully limit the amount of harm that they can do to your sight.

