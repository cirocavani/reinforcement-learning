ARG baseimage
FROM $baseimage

ARG condaenv

SHELL ["/bin/sh", "-lxc"]

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    DEFAULT_KERNEL_NAME="tf-agents"

RUN apt update && \
    apt install -y \
        --no-install-recommends \
        sudo \
        build-essential \
        bzip2 \
        git \
        xvfb \
        x11-utils \
        freeglut3-dev \
        libgl1-mesa-dri && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -G sudo user && \
    passwd -d user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user

USER user
WORKDIR /home/user

COPY --chown=user downloads/Miniconda3-4.6.14-Linux-x86_64.sh /tmp/
RUN bash /tmp/Miniconda3-4.6.14-Linux-x86_64.sh -b -p ~/conda && \
    rm /tmp/Miniconda3-4.6.14-Linux-x86_64.sh && \
    echo 'PATH=$HOME/conda/bin:$PATH' >> ~/.profile

COPY --chown=user jupyter/environment.yaml /tmp/environment-jupyter.yaml
COPY --chown=user jupyter/jupyter_notebook_config.py /home/user/.jupyter/
COPY --chown=user jupyter/start-jupyter.sh /home/user/bin/
RUN conda env create --name jupyter -f /tmp/environment-jupyter.yaml && \
    rm /tmp/environment-jupyter.yaml

COPY --chown=user $condaenv /tmp/environment-tf-agents.yaml
RUN conda env create --name tf-agents -f /tmp/environment-tf-agents.yaml && \
    rm /tmp/environment-tf-agents.yaml && \
    git -c http.sslVerify=false clone https://github.com/tensorflow/agents.git ~/tf-agents && \
    ~/conda/envs/tf-agents/bin/pip install -e ~/tf-agents[tests]

COPY --chown=user tensorflow-agents/kernel.json /tmp/tf-agents/kernel.json
RUN ~/conda/envs/jupyter/bin/jupyter kernelspec install /tmp/tf-agents --user --replace && \
    rm -rf /tmp/tf-agents

RUN conda clean -y --all

EXPOSE 8888

CMD /home/user/bin/start-jupyter.sh
