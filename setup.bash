#!/usr/bin/env bash
# generated from catkin/cmake/templates/setup.bash.in

CATKIN_SHELL=bash

export GAZEBO_MODEL_PATH="/Simulator/src/models_pkg:$GAZEBO_MODEL_PATH"
export ROS_PACKAGE_PATH="/Simulator/src:$ROS_PACKAGE_PATH"

# source setup.sh from same directory as this file
_CATKIN_SETUP_DIR=$(builtin cd "`dirname "${BASH_SOURCE[0]}"`" > /dev/null && pwd)
. "$_CATKIN_SETUP_DIR/setup.sh"
