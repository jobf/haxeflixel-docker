![](https://raw.githubusercontent.com/gmantaos/haxeflixel-docker/master/logo.png)

[![](https://img.shields.io/docker/pulls/gmantaos/haxeflixel.svg)](https://hub.docker.com/r/gmantaos/haxeflixel)
[![](https://images.microbadger.com/badges/image/gmantaos/haxeflixel.svg)](https://hub.docker.com/r/gmantaos/haxeflixel)
[![](https://images.microbadger.com/badges/version/gmantaos/haxeflixel.svg)](https://hub.docker.com/r/gmantaos/haxeflixel)
==========

Tags are versioned after the included [flixel](https://lib.haxe.org/p/flixel/) version.
The rest of the libs present like [Lime](https://lib.haxe.org/p/lime/) and [OpenFL](https://lib.haxe.org/p/openfl/), are generally at their latest available versions that work with HaxeFlixel at the time of building.

## Usage

The image is generally meant to be used as a build environment, such as for CI builds.

```bash
$ docker pull gmantaos/haxeflixel:4.6
```

It could also be used directly in a Dockerfile as an intermediate build image.

```Dockerfile
# Build environment
FROM gmantaos/haxeflixel:4.6 AS build-env

RUN lime build html5

# Runtime environment
FROM httpd:2.4

COPY --from=build-env /export/html5/ /usr/local/apache2/htdocs/
```

## Env

| Variable | Description | Value |
| -------- | ----------- | ----- |
| LIME_VERSION | The installed Lime version. | `7.2.1` |
| OPENFL_VERSION | The installed OpenFL version. | `8.8.0` |
| FLIXEL_VERSION | The installed HaxeFlixel version. | `4.6.0` |