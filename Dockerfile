FROM ros:noetic
SHELL ["/bin/bash", "-c"]


# install ros package
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-ros-tutorials \
    ros-${ROS_DISTRO}-common-tutorials && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    python3-rosdep \
    python3-catkin-tools \ 
    python3-rosinstall-generator \ 
    python3 \
    python3-dev \
    python3-pip \
    git \
    libboost-dev \
    libeigen3-dev \
    liblz4-dev \
    curl


WORKDIR /work

RUN python3 -m pip install --upgrade pip
RUN pip install --extra-index-url https://rospypi.github.io/simple/ rospy
RUN pip install --extra-index-url https://rospypi.github.io/simple/ tf
RUN pip install --extra-index-url https://rospypi.github.io/simple/ tf2_ros
RUN pip install --extra-index-url https://rospypi.github.io/simple/ visualization_msgs

# COPY rnet_driver .

## some reason doesn't do much and need to run in the terminal??
RUN source /opt/ros/noetic/setup.bash
RUN source /ros_entrypoint.sh

CMD ["bash"]
