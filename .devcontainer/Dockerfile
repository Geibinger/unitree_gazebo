FROM osrf/ros:noetic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

# Install additional ROS packages required by this repository
RUN apt-get update && apt-get install -y \
    ros-noetic-controller-manager \
    ros-noetic-joint-state-publisher-gui \
    ros-noetic-joint-state-controller \
    ros-noetic-teleop-twist-keyboard \
    ros-noetic-position-controllers \
    ros-noetic-gazebo-ros-control \
    ros-noetic-effort-controllers \
    ros-noetic-teleop-twist-joy \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-twist-mux \
    ros-noetic-xacro \
    sudo git && rm -rf /var/lib/apt/lists/*

# Create a non-root user so vscode works smoothly
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

ENV ROS_WS=/home/$USERNAME/catkin_ws
RUN mkdir -p $ROS_WS/src && chown -R $USERNAME:$USERNAME $ROS_WS

USER $USERNAME
WORKDIR $ROS_WS

