# ntqq docker

```bash
docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v $HOME/.config/QQ:/home/.config/QQ \
    -e GID="$(id -g)" \
    -e UID="$(id -u)" \
    \
    futuretech6/ntqq-docker
```
