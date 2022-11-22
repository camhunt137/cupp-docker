# cupp biolib example

## make docker/build

Build the docker image. This build a docker image which contains cupp and the relevant library files. The entry point just runs the example protein fasta in the app directory. See the Dockerfile for a more complete explanation.

## make docker/run

Runs the docker image with the standard entrypoint, for testing purposes.

## make docker/tag

Names (tags) the docker image, prior to uploading.

## make docker/push

Pushes the docker image to my docker hub

## make biolib/push

Pushes the config yaml file to the biolib platform. Requires a BIOLIB_TOKEN env set. I have this in my .envrc file which is not added into the github.
