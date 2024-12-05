#!/bin/bash

catkin_make --pkg utils

export GAZEBO_MODEL_PATH="/Simulator/src/models_pkg:$GAZEBO_MODEL_PATH"
export ROS_PACKAGE_PATH="/Simulator/src:$ROS_PACKAGE_PATH"

source devel/setup.bash

roslaunch sim_pkgs map2025objects.launch
