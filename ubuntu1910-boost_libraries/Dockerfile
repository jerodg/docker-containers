# Ubuntu 19.10 w/ Boost Library v1.72.0                                                                                                                                                    # Copyright © 2020 Jerod Gawne <https://github.com/jerodg>                                                                                                                                                                                                                                                                                                                          # This program is free software: you can redistribute it and/or modify                                                                                                                    # it under the terms of the GNU Affero General Public License as                                                                                                                          # published by the Free Software Foundation, either version 3 of the                                                                                                                      # License, or (at your option) any later version.                                                                                                                                                                                                                                                                                                                                   # This program is distributed in the hope that it will be useful,                                                                                                                         # but WITHOUT ANY WARRANTY; without even the implied warranty of                                                                                                                          # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                                                                                                                           # GNU Affero General Public License for more details.                                                                                                                                                                                                                                                                                                                               # You should have received a copy of the GNU Affero General Public License                                                                                                                # along with this program.  If not, see <https://www.gnu.org/licenses/>.                                                                                                                                                                                                                                                                                                            FROM jerodg/ubuntu_1910_base:20200306                                                                                                                                                                                                                                                                                                                                               # Install Pre-Requisites                                                                                                                                                                  RUN apt-get update                                                                                                                                                                        # OS                                                                                                                                                                                      RUN apt-get -y install \                                                                                                                                                                                      wget \                                                                                                                                                                                    build-essential      # Ubuntu 19.10 w/ Qbittorrent-Latest
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

FROM jerodg/ubuntu1910-python382-20200303

# Install Pre-Requisites
RUN apt-get update
RUN apt-get full-upgrade

RUN apt-get -y install \
    pkg-config \
    automake \
    libtool \
    git \
    zlib1g-dev \
    #    libboost-dev \
    #    libboost-system-dev \
    #    libboost-chrono-dev \
    #    libboost-random-dev \
    libssl-dev \
    libgeoip-dev

# Install Boost Libraries
# Release Page: https://www.boost.org/users/download/
WORKDIR /tmp
RUN wget https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz
RUN tar xzf boost_1*.tar.gz

WORKDIR /tmp/boost_1_72_0/tools/build
RUN ./bootstrap.sh
RUN b2 install

# References
# https://www.boost.org/doc/libs/1_72_0/more/getting_started/unix-variants.html
