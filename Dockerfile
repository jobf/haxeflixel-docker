FROM haxe:latest

LABEL maintainer="gmantaos@gmail.com"

# copy shortcut scripts
COPY ./scripts/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*

# install Lime and OpenFL
ENV LIME_VERSION=7.9.0 \
    OPENFL_VERSION=9.1.0

# install zip for packaging things up, e.g. to deploy an artifact
RUN apt-get -y install zip

# install yui-compressor to support minification
RUN apt-get -y install yui-compressor

RUN haxelib install lime $LIME_VERSION
RUN haxelib install openfl $OPENFL_VERSION

# install HaxeFlixel
ENV FLIXEL_VERSION=4.9.0 \
    FLIXEL_ADDONS_VERSION=2.9.0 \
    FLIXEL_TOOLS_VERSION=1.4.4

RUN haxelib install flixel $FLIXEL_VERSION
RUN haxelib install flixel-addons $FLIXEL_ADDONS_VERSION
RUN haxelib install flixel-tools $FLIXEL_TOOLS_VERSION

# run setup scripts
RUN haxelib run lime setup flixel
RUN haxelib run lime setup --never
