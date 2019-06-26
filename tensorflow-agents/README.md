# TensorFlow Agents

TF-Agents is a library for Reinforcement Learning in TensorFlow.

https://github.com/tensorflow/agents


**Reinforcement Learning in TensorFlow with TF-Agents (TF Dev Summit '19)**

Published on Mar 6, 2019 - 16 minutes

Learn how to use TensorFlow and Reinforcement Learning to solve complex tasks.

https://www.youtube.com/watch?v=-TTziY7EmUA


## Setup

Build a Docker Container containing TensorFlow Agents.

**CPU**

```sh
../bin/download-deps.sh
./container-build.sh cpu
```

**GPU**

Requires [NVidia Docker](../nvidia/README.md).

```sh
../bin/download-deps.sh
./container-build.sh gpu
```


## Usage

Start the Container.

CPU:

```sh
./container-start.sh cpu
```

GPU:

```sh
./container-start.sh gpu
```

Open on the Host.

(Jupyter Notebook)

http://127.0.0.1:8888


> See examples notebooks at `~/tf-agents/tf_agents/colabs`.


Stop the Container.

CPU:

```sh
./container-stop.sh cpu
```

GPU:

```sh
./container-stop.sh gpu
```
