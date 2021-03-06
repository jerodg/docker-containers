# Ubuntu 20.04 Base Docker Image Optimized for Containers
#   w/ Boost Library v1.72.0 & B2 (Boost Build)
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

FROM jerodg/base:ubuntu_20.04-2020.03.29

# Install Pre-requisites
RUN apt-get -y install wget

# Install Boost Libraries
WORKDIR /tmp
RUN wget https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz
RUN tar xzf boost_1*.tar.gz

# Build B2
WORKDIR /tmp/boost_1_72_0/tools/build
RUN ./bootstrap.sh --with-toolset=gcc
RUN ./b2 install -a --prefix=/usr/local

# Build Boost
WORKDIR /tmp/boost_1_72_0
RUN b2 -a toolset=gcc runtime-link=shared threading=multi --build-dir=/usr/local/lib release

# Cleanup
RUN rm -rf /tmp/*
RUN apt-get autoclean
RUN apt-get autoremove

# Use For Development; Keeps the Container Running
ENTRYPOINT ["/bin/bash", "-c", "while true; do sleep 1; done"]

# References
# https://www.boost.org/doc/libs/1_72_0/more/getting_started/unix-variants.html
# https://github.com/boostorg/build
# Boost Release Page: https://www.boost.org/users/download/
