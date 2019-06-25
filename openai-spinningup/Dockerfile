FROM ubuntu:16.04

SHELL ["/bin/sh", "-lxc"]

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    DEFAULT_KERNEL_NAME="spinningup"

RUN apt update && \
    apt full-upgrade -y && \
    apt install -y \
        --no-install-recommends \
        sudo \
        build-essential \
        libopenmpi-dev \
        freeglut3-dev \
        libgl1-mesa-dri \
        git \
        unzip \
        xvfb \
        x11vnc \
        fluxbox \
        net-tools && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -G sudo user && \
    passwd -d user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user

USER user
WORKDIR /home/user

COPY --chown=user downloads/novnc-1.1.0.zip /tmp/
COPY --chown=user downloads/websockify-0.8.0.zip /tmp/
RUN mkdir -p ~/libs/ ~/logs/ && \
    unzip /tmp/novnc-1.1.0.zip -d ~/libs/ && \
    unzip /tmp/websockify-0.8.0.zip -d ~/libs/ && \
    ln -s ~/libs/websockify-0.8.0 ~/libs/noVNC-1.1.0/utils/websockify && \
    rm /tmp/novnc-1.1.0.zip /tmp/websockify-0.8.0.zip

COPY --chown=user downloads/Miniconda3-4.6.14-Linux-x86_64.sh /tmp/
RUN bash /tmp/Miniconda3-4.6.14-Linux-x86_64.sh -f -b -p ~/conda && \
    echo 'PATH=$HOME/conda/bin:$PATH' >> ~/.profile && \
    rm /tmp/Miniconda3-4.6.14-Linux-x86_64.sh

# numpy required by websockify
RUN conda update -n base -y conda && \
    conda update -q -y --all && \
    conda install -y numpy

COPY --chown=user jupyter/environment.yaml /tmp/environment-jupyter.yaml
COPY --chown=user jupyter/jupyter_notebook_config.py /home/user/.jupyter/
COPY --chown=user jupyter/start-jupyter.sh /home/user/bin/
RUN conda env create --name jupyter -f /tmp/environment-jupyter.yaml && \
    rm /tmp/environment-jupyter.yaml

COPY --chown=user openai-spinningup/lunar-lander-learn.sh /home/user/
COPY --chown=user openai-spinningup/lunar-lander-watch.sh /home/user/
COPY --chown=user openai-spinningup/environment.yaml /tmp/environment-spinningup.yaml
RUN conda env create --name spinningup -f /tmp/environment-spinningup.yaml && \
    rm /tmp/environment-spinningup.yaml && \
    git -c http.sslVerify=false clone https://github.com/openai/spinningup.git ~/spinningup && \
    ~/conda/envs/spinningup/bin/pip install -e ~/spinningup && \
    mkdir -p ~/data/

COPY --chown=user openai-spinningup/kernel.json /tmp/spinningup/kernel.json
RUN ~/conda/envs/jupyter/bin/jupyter kernelspec install /tmp/spinningup --user --replace && \
    rm -rf /tmp/spinningup

RUN conda clean -y --all

COPY --chown=user openai-spinningup/start-jupyter-x.sh /home/user/bin/

EXPOSE 8888
EXPOSE 6080

CMD /home/user/bin/start-jupyter-x.sh
