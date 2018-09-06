#!/bin/bash -e

user_alias=zhu45 # we already create a user 'zhu45' inside image
user_home_docker="/home/$user_alias"
hist_file_path="$HOME/.devenv.docker.bash_history"
default_repos_mount_dir="/work"

for i in "$@"
do
case $i in
  --repos-base-dir=*|--repos_base_dir=*)
  repos_base_dir="${i#*=}"
  shift
  ;;
  --repos-mount-dir=*|--repos_mount_dir=*)
  repos_mount_dir="${i#*=}"
  shift
  ;;
  *)
  echo "unknown option: $i"
  exit 1
  ;;
esac
done

if [ -z "$repos_base_dir" ]; then repos_base_dir="$HOME/git"; fi

echo "repos_base_dir=$repos_base_dir"
echo "repos_mount_dir=$repos_mount_dir"
echo "default_repos_mount_dir=$default_repos_mount_dir"

if [ ! -f "$hist_file_path" ]; then
  touch $hist_file_path
fi

printf "\n"
printf "\n"

docker_args=""

if [ -n "$repos_mount_dir" ]; then
  docker_args="$docker_args -v $repos_base_dir:$repos_mount_dir"
fi

docker run -it --rm \
    --privileged=true \
    -u $user_alias \
    --cap-add=SYS_PTRACE \
    -e DISPLAY=$DISPLAY \
    -e HIST_FILE=$user_home_docker/.bash_history \
    -v=$hist_file_path:$user_home_docker/.bash_history \
    -v /var/run/docker.sock:/var/run/docker.sock   \
    -v /tmp/.docker.xauth:/tmp/.docker.xauth \
    -v $repos_base_dir:$default_repos_mount_dir \
    -v ${HOME}/.ssh:$user_home_docker/.ssh \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    ferrishu3886/yggdrasil_env \
    /bin/bash


