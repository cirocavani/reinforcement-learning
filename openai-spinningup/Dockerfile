FROM ubuntu:16.04

SHELL ["/bin/sh", "-lxc"]

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

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
    passwd -d user

USER user
WORKDIR /home/user

COPY --chown=user downloads/novnc-1.0.0.zip /tmp/
COPY --chown=user downloads/websockify-0.8.0.zip /tmp/
RUN mkdir -p ~/libs/ ~/logs/ && \
    unzip /tmp/novnc-1.0.0.zip -d ~/libs/ && \
    unzip /tmp/websockify-0.8.0.zip -d ~/libs/ && \
    ln -s ~/libs/websockify-0.8.0 ~/libs/noVNC-1.0.0/utils/websockify && \
    rm /tmp/novnc-1.0.0.zip /tmp/websockify-0.8.0.zip

COPY --chown=user downloads/Miniconda3-4.5.11-Linux-x86_64.sh /tmp/
RUN bash /tmp/Miniconda3-4.5.11-Linux-x86_64.sh -f -b -p ~/conda && \
    echo 'PATH=$HOME/conda/bin:$PATH' >> ~/.profile && \
    rm /tmp/Miniconda3-4.5.11-Linux-x86_64.sh

RUN conda update -n base -y conda && \
    conda update -q -y --all && \
    conda install -y numpy

RUN conda create -n jupyter python=3.7 && \
    conda install -n jupyter -y jupyter && \
    conda install -n jupyter -y -c conda-forge rise

COPY --chown=user openai-spinningup/lunar-lander-learn.sh /home/user/work/
COPY --chown=user openai-spinningup/lunar-lander-watch.sh /home/user/work/
RUN mkdir -p ~/work/ ~/data/ && \
    conda create -n spinningup python=3.6 && \
    conda install -n spinningup -y ipykernel && \
    git \
        -c http.sslVerify=false \
        clone \
        https://github.com/openai/spinningup.git \
        ~/work/spinningup && \
    cd ~/work/spinningup && \
    ~/conda/envs/spinningup/bin/pip install -e .

COPY --chown=user openai-spinningup/spinningup-kernel.json /tmp/spinningup/kernel.json
RUN ~/conda/envs/jupyter/bin/jupyter kernelspec install /tmp/spinningup --user --replace && \
    rm -rf /tmp/spinningup

COPY --chown=user openai-spinningup/jupyter_notebook_config.py /home/user/.jupyter/
COPY --chown=user openai-spinningup/start-server.sh /home/user/bin/

RUN conda clean -y --all

EXPOSE 8888
EXPOSE 6080

CMD /home/user/bin/start-server.sh
