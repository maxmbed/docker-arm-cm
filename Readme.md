# Docker Buildroot
A Docker container to build ARM cortex-m target with gcc through a bind working directory.

# Build images

```shell
docker build -t docker-arm-cm .
```

# Usage

```shell
cd <to target project directory>
```

```shell
docker run -it --mount type=bind,source="$(pwd)",destination=/target docker-arm-cm
```

Then your work directory should be bind in `/target`.
