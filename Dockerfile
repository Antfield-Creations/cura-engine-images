# We use a pretty recent version in order to get the right gcc and cmake versions
FROM ubuntu:23.04 as builder

# See https://github.com/Ultimaker/CuraEngine/tags for available version tags
ARG CURA_ENGINE_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3-pip build-essential cmake ninja-build git

RUN pip3 install conan==1.60.2 --break-system-packages
RUN conan config install https://github.com/ultimaker/conan-config.git
RUN conan profile new default --detect --force
RUN git clone --depth 1 --branch ${CURA_ENGINE_VERSION} https://github.com/Ultimaker/CuraEngine.git

WORKDIR CuraEngine

RUN conan install . --build=missing --update
RUN cmake --preset release
RUN cmake --build --preset release

#FROM debian:bookworm-slim
#COPY --from=builder CuraEngine/build/Release /CuraEngine
#
#CMD ["build/Release/CuraEngine", "help"]
