# ubuntu-gitlab

## 登录docker hub
```shell
(py39) baozhu@bz:/tmp/ubuntu-gitlab$ sudo docker  login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: baozhu
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

## 编译镜像
```shell
sudo docker  build .  --build-arg CACHEBUST=$(date +%s)
```
也可以选择不带cache编译镜像
```shell
sudo docker  build . --no-cache   --build-arg CACHEBUST=$(date +%s)
```

## 上传
1, 找到最新的images
```shell
(py39) baozhu@bz:/tmp/ubuntu-gitlab$ sudo docker images
REPOSITORY                                                          TAG                                        IMAGE ID       CREATED          SIZE
baozhu/ubuntu                                                       22.04-1                                    f7026eddc64b   2 minutes ago    1.34GB
<none>                                                              <none>                                     0b6d5bfbbacf   7 minutes ago    745MB
<none>                                                              <none>                                     664b07e4b930   9 minutes ago    745MB
<none>                                                              <none>                                     e238443f8208   15 minutes ago   745MB
<none>                                                              <none>                                     fab8b5742b7c   17 minutes ago   599MB
<none>                                                              <none>                                     388db7896340   19 minutes ago   745MB
<none>                                                              <none>                                     0daad2a29cfc   3 weeks ago      513MB
ubuntu                                                              <none>                                     58db3edaf2be   3 weeks ago      77.8MB
debian                                                              buster                                     ca6b2352d81d   6 weeks ago      114MB
mariadb                                                             10.4                                       7220d96a2fee   3 months ago     395MB
ultralytics/yolov5                                                  latest                                     dfe0204ed2ca   7 months ago     15.2GB
registry.gitlab.com/gitlab-org/gitlab-runner/gitlab-runner-helper   x86_64-f761588f                            bceb5c812e4e   8 months ago     66.9MB
nvidia/cuda                                                         11.0.3-base-ubuntu20.04                    d134f267bb7a   9 months ago     122MB
gitlab/gitlab-runner                                                latest                                     89944ac4ab2c   9 months ago     691MB
kubeedge/build-tools                                                latest                                     be42fa330e60   10 months ago    945MB
gpu_burn                                                            latest                                     e72191ab7e83   11 months ago    2.52GB
<none>                                                              <none>                                     e322dc547696   11 months ago    4.8GB
uptane/ota-lith                                                     3d60bb94256e58dfe0a42a9bec90ae58dea1d1ab   364368183fef   12 months ago    379MB
uptane/ota-lith                                                     latest                                     364368183fef   12 months ago    379MB
wurstmeister/kafka                                                  2.13-2.7.1                                 30b096e7d71b   13 months ago    505MB
<none>                                                              <none>                                     bb793d698bcd   14 months ago    277MB
<none>                                                              <none>                                     7c84084f31c3   14 months ago    277MB
<none>                                                              <none>                                     8cf3d5f8c9ab   14 months ago    284MB
<none>                                                              <none>                                     d6c91c81b061   14 months ago    282MB
<none>                                                              <none>                                     fb379a1cb7b3   14 months ago    282MB
<none>                                                              <none>                                     b2e31e8146d1   14 months ago    286MB
<none>                                                              <none>                                     ed0b880ccb2d   14 months ago    286MB
<none>                                                              <none>                                     2c2a4d8b8b17   14 months ago    285MB
<none>                                                              <none>                                     c80029b5ef10   14 months ago    285MB
<none>                                                              <none>                                     12c43e03eec7   14 months ago    285MB
<none>                                                              <none>                                     1461625a7503   14 months ago    286MB
<none>                                                              <none>                                     9c305857a818   14 months ago    286MB
<none>                                                              <none>                                     2da9ee67290e   14 months ago    286MB
<none>                                                              <none>                                     6f7bdb4f9ba9   14 months ago    286MB
<none>                                                              <none>                                     679645debb66   14 months ago    286MB
<none>                                                              <none>                                     119d97eaf860   14 months ago    286MB
<none>                                                              <none>                                     ef4f815fde10   14 months ago    286MB
<none>                                                              <none>                                     c3e0b8b5104d   14 months ago    286MB
<none>                                                              <none>                                     73eb034bfd06   14 months ago    286MB
<none>                                                              <none>                                     b597ec594b16   14 months ago    286MB
<none>                                                              <none>                                     1b9c4b8bad6b   14 months ago    286MB
<none>                                                              <none>                                     6a052b413322   14 months ago    286MB
<none>                                                              <none>                                     b97c0ca419e9   14 months ago    286MB
<none>                                                              <none>                                     9fb246af9431   14 months ago    286MB
<none>                                                              <none>                                     a179ebe65b4e   14 months ago    286MB
<none>                                                              <none>                                     fa6c8bacccc6   14 months ago    286MB
<none>                                                              <none>                                     cfcb03156e46   14 months ago    286MB
<none>                                                              <none>                                     00e901894386   14 months ago    286MB
<none>                                                              <none>                                     a6c5bc4a3dd4   14 months ago    286MB
<none>                                                              <none>                                     bc1710f1176f   14 months ago    286MB
<none>                                                              <none>                                     7bc7fc09f995   14 months ago    286MB
<none>                                                              <none>                                     cc4e69331e53   14 months ago    286MB
<none>                                                              <none>                                     2fea26119241   14 months ago    286MB
<none>                                                              <none>                                     6d262b15dedf   14 months ago    286MB
<none>                                                              <none>                                     a048dd360d5a   15 months ago    285MB
<none>                                                              <none>                                     a3911c534d32   15 months ago    285MB
<none>                                                              <none>                                     a58aacde221d   15 months ago    285MB
<none>                                                              <none>                                     ca432a477918   15 months ago    262MB
<none>                                                              <none>                                     f79d49d8325c   15 months ago    234MB
<none>                                                              <none>                                     827768077371   15 months ago    261MB
balenalib/intel-nuc-debian                                          buster-20210705                            35afe358f80f   19 months ago    163MB
nvidia/cuda                                                         11.1.1-devel                               5698749ebee4   20 months ago    4.8GB
nvidia/cuda                                                         11.1.1-runtime                             021c4cc822a6   20 months ago    2.52GB
traefik                                                             v2.3                                       ddb0268e5b5f   2 years ago      92.4MB
docker                                                              19.03.10-dind                              5f8436f276d2   2 years ago      225MB
baozhu/ubuntu                                                       22.04                                      f2112b9e7ae6   2 years ago      599MB
ubuntu-gitlab                                                       latest                                     f2112b9e7ae6   2 years ago      599MB
ubuntu                                                              22.04                                      f2112b9e7ae6   2 years ago      599MB
<none>                                                              <none>                                     1d7abd965692   2 years ago      94.8MB
ubuntu                                                              20.04                                      a3282b72a167   2 years ago      73.8MB
wurstmeister/zookeeper                                              latest                                     3f43f72cb283   4 years ago      510MB
nginx                                                               1.13.7                                     f895b3fb9e30   5 years ago      108MB

```
2, 新建tag
这里新建的tag，格式保持sudo docker tag <IMAGE ID> <docker hub username>/<repo name>:<version>
```shell
(py39) baozhu@bz:/tmp/ubuntu-gitlab$ sudo docker tag f7026eddc64b baozhu/ubuntu:22.04-1
```

3, 推送
```shell
sudo docker push baozhu/ubuntu:22.04-1
```