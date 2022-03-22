# docker-excelcompare

A lightweight docker image for ExcelCompare https://github.com/na-ka-na/ExcelCompare

Usage:

```
docker run -v "$PWD":/wd:ro lukauskas/docker-excelcompare [excel_cmp parameters]
```

Note that I am mounting the current working directory to the `/wd` location in the container as read only.

See https://github.com/na-ka-na/ExcelCompare for documentation of which parameters to use.

To build this:

```
docker build -t lukauskas/docker-excelcompare:0.6.1 -t lukauskas/docker-excelcompare:latest .
```
