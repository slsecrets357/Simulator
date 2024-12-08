# ROS Container
Docker container with base ros-noetic-desktop installation
This container is mostly used to create other images that will run the ROS simulator and other ros nodes/clients.

1. Install docker and docker compose.

2. Allow docker to use your graphics. For reference, Yu's environment uses the X11 X server, to grant docker permission, he needs to run xhost +local:docker.

3. Install the necessary nvidia drivers for your machine.

4. Run docker compose up or ./build.sh to build the ros image.

7. Navigate back to the root directory at /Simulator.

8. run ./build.sh to build the simulator image.

9. run ./simulator.sh to start the simulator container.

10. run ./container.sh to launch the simulator.

11. After each build, you can close the container.
