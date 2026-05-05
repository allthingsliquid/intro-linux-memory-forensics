FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    pipx \
    git \
    strace \
    curl \
    ca-certificates \
    build-essential \
    unzip \
    vim \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

RUN id -u ubuntu >/dev/null 2>&1 || useradd -ms /bin/bash ubuntu
USER ubuntu

RUN pipx install volatility3 \
    && pipx inject volatility3 capstone pefile yara-python pycryptodome \
    && pipx ensurepath 

WORKDIR /home/ubuntu
RUN source .bashrc

CMD ["/bin/bash"]