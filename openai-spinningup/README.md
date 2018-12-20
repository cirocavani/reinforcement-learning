# OpenAI Spinning Up

An educational resource to help anyone learn deep reinforcement learning.

https://spinningup.openai.com/

https://github.com/openai/spinningup


## Setup

Build a Docker Container containing OpenAI Spinning Up.

```sh
../bin/download-deps.sh
./container-build.sh
```


## Usage

Start the Container.

```sh
./container-start.sh
```

Open on the Host.

(Jupyter Notebook)

http://127.0.0.1:8888

(VNC Web Client)

http://127.0.0.1:6080/vnc.html


Open a Terminal on Jupyter and run the following test.

> https://gym.openai.com/envs/LunarLander-v2/
> 
> [`lunar-lander-learn.sh`](lunar-lander-learn.sh)
> 
> [`lunar-lander-watch.sh`](lunar-lander-watch.sh)

```sh
# Learn an agent that plays Lunar Lander (Console output)

~/work/lunar-lander-learn.sh

# Watch the agent playing Lunar Lander (VNC Web Client window) 

~/work/lunar-lander-learn.sh
```

Stop the Container.

```sh
./container-stop.sh
```
