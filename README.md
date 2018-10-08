# icclab_turtlebot

Base scripts for the turtlebots at ICCLab.

These scripts enable mapping and navigation using a LIDAR device (rplidar) upon a turtlebot 2.

# Launch files

In the launch directory you will find:
- `minimal_with_rplidar.launch`: launches the "minimal" turtlebot_bringup script + the rplidar node
- `gmapping_icclab.launch`: gmapping using the rplidar input on /scan topic instead of the kinect
- `amcl_icclab.launch`: amcl using the rplidar
- `10-local.rules` makes sure that when the rplidar is connected with 
  USB it's given a consistent name through a symlink (`/dev/rplidar`) you should save the file in
  `/etc/udev/rules.d/10-local.rules` on your turtlebot

# Dependencies

* The rplidar model uses a mesh from the [hector_sensors_description package](https://wiki.ros.org/hector_sensors_description), so you need to have that installed
* The actual rplidar ROS node we're using allows us to stop the rotation motor, and [it's available here](https://github.com/negre/rplidar_ros.git).

# Install

git clone 

# Howto

## Simulation of SLAM using Gazebo + rviz

On laptop:

`roslaunch icclab_turtlebot gmapping_icclab_simulation.launch GAZEBO_GUI:=true`

## SLAM with actual Turtlebot

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





