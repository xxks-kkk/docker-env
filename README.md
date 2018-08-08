# Docker-based development

To use the docker image

```
docker pull ferrishu3886/yggdrasil_env
```

Then, start the docker environment via `./startenv.sh`

To attach to existing container, use

```
docker ps

#above cmd will list the running containers. note the hash (container id) of 
#the container you are interested in and then attach to it using the cmd below

docker exec -it [container-id-hash] /bin/bash
```

**NOTE:**

- We mount `$HOME/git` directory inside the docker as `/work`. To specify a different location to mount,
  use `--repos-base-dir` option.
  
```
# default one
./startenv.sh --repos-base-dir=$HOME/git
```


