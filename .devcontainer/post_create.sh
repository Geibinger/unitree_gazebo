#!/bin/bash
set -e
source /opt/ros/noetic/setup.bash
ROS_WS=$HOME/catkin_ws
SRC_DIR=$ROS_WS/src
REPO_DIR=${WORKSPACE_FOLDER:-$PWD}
ln -sfn $REPO_DIR $SRC_DIR/unitree_gazebo
cd $ROS_WS
rosdep update
rosdep install --from-paths src --ignore-src -r -y
catkin_make
echo "source $ROS_WS/devel/setup.bash" >> $HOME/.bashrc
