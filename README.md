# docker-gitbian

run git server on debian.

## example
run git service:
```
docker container run --rm --detach  \
  --publish 2022:22 \
  --volume /git/data:/git \
  --volume /git/user/authorized_keys:/home/git/.ssh/authorized_keys:ro \
  gitbian:v1.0.1
```
create new repo:
```
$ ssh gitbian
$ cd /git
$ mkdir project_000.git; cd project_000.git
$ git init --bare

# now you can clone new repo
$ git clone git@gitbian:/git/project_000.git
```
add existing bare repository on a server:
```
$ scp -r project_001.git gitbian:/git

# now you can clone repo
$ git clone git@gitbian:/git/project_000
```

## todo
prepare sshd configuration for non-root user.
