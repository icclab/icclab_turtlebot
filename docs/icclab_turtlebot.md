# ICCLab Turtlebot HW/SW Description

WARNING: This doc is being moved to the wiki

## Software install

### Turtlebot 2

Needed packages:

- https://github.com/icclab/icclab_turtlebot (branch `turtlebot2`)
- https://github.com/icclab/laser_filters (branch: `indigo-devel`)
- https://github.com/robopeak/rplidar_ros (branch: `master`)
- *Optional (?)*: https://github.com/icclab/rosnodeinfo (branch: `master`)

Clone these repositories to your catkin workspace `src` directory (e.g. `~/catkin_ws/src`) and then compile the packages with `catkin_make` from the root of your catkin workspace (e.g. `~/catkin_ws`.

Once these are compiled, you will need to setup the USB rules for the rplidar so the scanner has a consistent device name (`/dev/rplidar`). These udev scripts can be found in [turtlebot2 branch](https://github.com/icclab/icclab_turtlebot/tree/turtlebot2) under `icclab_turtlebot/tb2_root_files`.

In order to ensure that the time on the Turtlebot2 is synchronised, ensure that the ntp service is installed. You can install it using: `sudo apt-get install ntp`.

### Launch files

In the [launch directory](../launch) you will find:

* `minimal_with_rplidar.launch`: launches the "minimal" turtlebot_bringup script + the rplidar node
* `gmapping_icclab.launch`: gmapping using the rplidar input on /scan topic instead of the kinect
* `amcl_icclab.launch`: amcl using the rplidar
* `10-local.rules` makes sure that when the rplidar is connected with 
  USB it's given a consistent name through a symlink (`/dev/rplidar`) you should save the file in
  `/etc/udev/rules.d/10-local.rules` on your turtlebot

### Install

```shell
git clone https://github.com/icclab/icclab_turtlebot.git -b kinetic ~/catkin_ws/src/icclab_turtlebot
cd catkin_ws
catkin_build
```

#### Dependencies

* The rplidar model comes from a mesh in the [hector_sensors_description package](https://wiki.ros.org/hector_sensors_description). It is included here for convenience.
* The actual rplidar ROS node we're using allows us to stop the rotation motor, and [it's available here](https://github.com/negre/rplidar_ros.git).
  * `git clone https://github.com/negre/rplidar_ros.git ~/catkin_ws/src/rplidar_ros`
  * `cd ~/catkin_ws && catkin_make`

# Howto

## Simulation of SLAM using Gazebo + rviz

On laptop:

```shell
roslaunch icclab_turtlebot gmapping_icclab_simulation.launch GAZEBO_GUI:=true
```

## SLAM with Turtlebot

On the Turtlebot launch:

```shell
roslaunch icclab_turtlebot minimal_with_rplidar.launch
# roslaunch icclab_turtlebot amcl_icclab.launch map_file:=/home/turtlebot/catkin_ws/src/icclab_turtlebot/icclab_latest_map.yaml
roslaunch icclab_turtlebot amcl_icclab.launch map_file:=/home/turtlebot/catkin_ws/src/icclab_turtlebot/icclab_latest_map.yaml initial_pose_x:=-6.2 initial_pose_y:=2 initial_pose_a:=3.50
```

On the laptop:

```shell
roslaunch turtlebot_rviz_launchers view_navigation.launch
```
