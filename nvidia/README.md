# NVidia Docker

Container with GPU support requires NVidia GPU (CUDA compatible) and NVidia Docker runtime.


## Setup

Based on image:

`nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04`.

https://hub.docker.com/r/nvidia/cuda/

(compatible with TensorFlow GPU package)

Requirements:

* NVidia Driver at least 410
* NVidia Docker V2 runtime

...

Install NVidia Driver.

https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa

(at least 410 is required for CUDA 10.0)

...

Install Docker Engine and NVidia Docker runtime.

https://docs.docker.com/install/linux/docker-ce/ubuntu/

https://github.com/NVIDIA/nvidia-docker

...
