FROM nvidia/cudagl:11.1.1-base-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG LIBRS_VERSION=2.56.3

# Dependencies
RUN apt-get update \
    && apt-get install -qq -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    libssl-dev \
    libusb-1.0-0-dev \
    pkg-config \
    libgtk-3-dev \
    libglfw3-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \    
    curl \
    python3 \
    python3-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download sources
WORKDIR /usr/src
RUN curl https://codeload.github.com/IntelRealSense/librealsense/tar.gz/refs/tags/v$LIBRS_VERSION -o librealsense.tar.gz 
RUN tar -xvf librealsense.tar.gz \
    && rm librealsense.tar.gz 
RUN ln -s /usr/src/librealsense-$LIBRS_VERSION /usr/src/librealsense

# Build and install intel real sense
RUN cd /usr/src/librealsense \
    && mkdir build && cd build \
    && cmake \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DCMAKE_C_FLAGS_RELEASE="${CMAKE_C_FLAGS_RELEASE} -s" \
    -DCMAKE_CXX_FLAGS_RELEASE="${CMAKE_CXX_FLAGS_RELEASE} -s" \
    -DCMAKE_INSTALL_PREFIX=/opt/librealsense \    
    -DBUILD_GRAPHICAL_EXAMPLES=OFF \
    -DBUILD_PYTHON_BINDINGS:bool=true \
    -DCMAKE_BUILD_TYPE=Release ../ \
    && make -j$(($(nproc)-1)) all \
    && make install 

RUN apt-get update \
    && apt-get install -y --no-install-recommends \	
    libusb-1.0-0 \
    udev \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    locales \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local && cp -r /opt/librealsense /usr/local/
RUN mkdir -p /etc/udev/rules.d && cp /usr/src/librealsense/config/99-realsense-libusb.rules /etc/udev/rules.d/
RUN cp /usr/src/librealsense/config/99-realsense-d4xx-mipi-dfu.rules /etc/udev/rules.d/

RUN dpkg-reconfigure locales
 
# Install ROS Noetic
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update \
&& apt-get install -y ros-noetic-desktop-full

RUN apt-get install -y python3-rosdep

RUN rosdep init \
 && rosdep fix-permissions \
 && rosdep update

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
