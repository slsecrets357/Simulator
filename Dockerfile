FROM ros-ubuntu:latest

WORKDIR /Simulator

COPY . .

#RUN catkin_make

#RUN export GAZEBO_MODEL_PATH="/Simulator/src/models_pkg:$GAZEBO_MODEL_PATH"
#RUN export ROS_PACKAGE_PATH="/Simulator/src:$ROS_PACKAGE_PATH"

## Usage
#RUN source devel/setup.bash
