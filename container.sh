#!/bin/bash

docker exec -it simulator /bin/bash -c "source devel/setup.bash && roslaunch sim_pkg map2025objects.launch"
