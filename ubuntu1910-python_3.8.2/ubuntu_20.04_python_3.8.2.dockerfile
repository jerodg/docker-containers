# Ubuntu 19.10 w/ Shared & Optimized Python 3.8.2
# Copyright © 2020 Jerod Gawne <https://github.com/jerodg>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM jerodg/base:ubuntu_20.04-2020.03.27

# Python
# Todo: Verify Libraries
RUN apt-get -y install \
    binutils \
    build-essential \
    cython3 \
    debhelper-compat \
    dh-python \
    freetds-dev \
    libb2-dev \
    libbz2-dev \
    libdb5.3-dev \
    libexpat1-dev \
    libffi-dev \
    libgdbm-dev \
    libkrb5-dev \
    liblzma-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libzfslinux-dev \
    python3-all-dev \
    python3-pytest-xvfb \
    python3-pyvirtualdisplay \
    python3-setuptools \
    python3-testresources \
    python3-xvfbwrapper \
    uuid-dev \
    wget \
    xvfb \
    xz-utils \
    zlib1g-dev

# Get Source
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
RUN tar xf Python-3.8.2.tgz

# Build Source
WORKDIR /tmp/Python-3.8.2
RUN ./configure --enable-optimizations --enable-shared
RUN make
RUN make install

# Configure Shared Link Library
RUN strip /usr/local/lib/libpython3.8.so.1.0
RUN ldconfig

# Configure Symbolic Links
WORKDIR /usr/local/bin
RUN ln -s /usr/local/bin/python3.8 python
RUN ln -s /usr/local/bin/pip3.8 pip

# Update Core Python Packages
RUN pip install --upgrade pip setuptools

# Cleanup
RUN rm -rf /tmp/*
RUN apt-get autoclean
RUN apt-get autoremove

# Use For Development; Keeps the Container Running
# # ENTRYPOINT ["/bin/bash", "-c", "while true; do sleep 1; done"]
