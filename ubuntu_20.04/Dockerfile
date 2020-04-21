# syntax=docker/dockerfile:experimental

# Ubuntu 20.04 Base Docker Image Optimized for Containers
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

FROM --platform=linux/amd64 ubuntu:focal

ENV TZ=UTC

# Update Everything
COPY ./cfg/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y full-upgrade

# Cleanup
RUN rm -rf /tmp/*
RUN apt-get autoclean
RUN apt-get autoremove

LABEL version="1.0.0"
LABEL maintainer="Jerod Gawne <https://github.com/jerodg>"


# Use For Development; Keeps the Container Running
# ENTRYPOINT ["/bin/bash", "-c", "while true; do sleep 1; done"]
