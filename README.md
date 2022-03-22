# docker-excelcompare

A lightweight docker image for ExcelCompare https://github.com/na-ka-na/ExcelCompare
Based on https://github.com/maslick/minimalka image.

[See also on hub.docker.com](https://hub.docker.com/r/lukauskas/docker-excelcompare).

-------------------------

Usage:

```
docker run --rm -v "$PWD":/wd:ro lukauskas/docker-excelcompare [ExcelCompare parameters]
```

Note that I am mounting the current working directory to the `/wd` location in the container as read only.

Consult https://github.com/na-ka-na/ExcelCompare for documentation of what `[ExcelCompare parameters]` to use.

In case you need to pass some Java parameters into the script,
use the `JAVA_OPTIONS` environment variable. For instance, if you can expand HEAP space to  2GB like this:

```
docker run --rm -v "$PWD":/wd:ro -e JAVA_OPTIONS='-Xmx2G' lukauskas/docker-excelcompare [ExcelCompare parameters]
```

The key here is `-Xmx2G` java parameter.

------------------

To build this image use:

```
docker build -t lukauskas/docker-excelcompare:0.6.1 -t lukauskas/docker-excelcompare:latest .
```
