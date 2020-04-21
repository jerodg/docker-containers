# syntax=docker/dockerfile:experimental

# Ubuntu 20.04 Base Docker Image Optimized for Containers
#     w/ Traefik 2.2.0
# Copyright © 2020 Jerod Gawne <https://github.com/jerodg>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# EXPERIMENTAL BUILD

FROM jerodg/base:ubuntu_20.04-2020.03.29

# RUN apt-get -y install wget

# WORKDIR /tmp
# RUN wget https://github.com/containous/traefik/releases/download/v2.2.0/traefik_v2.2.0_linux_amd64.tar.gz
# RUN tar -zxvf traefik_${traefik_version}_linux_${arch}.tar.gz
COPY ./bin/traefik /usr/local/bin/traefik
RUN chmod +x /usr/local/bin/traefik

LABEL version="1.0.0"
LABEL maintainer="Jerod Gawne <https://github.com/jerodg>"


# Use For Development; Keeps the Container Running
ENTRYPOINT ["/bin/bash", "-c", "while true; do sleep 1; done"]
