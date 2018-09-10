# icclab_turtlebot
Base scripts for turtlebot3 at ICCLab.

# TL;DR

In the launch directory you will find:
- minimal.launch : launches the "minimal" turtlebot_bringup script + Realsense camera node + Scanse Sweep laser node + move_base 
- minimal_exploration.launch : launch file used for demo webapp
- minimal_amcl.launch : _needs to be updated_
- minimal_gmapping.launch : _needs to be updated_

# How to try things out

## Simulation of SLAM using Gazebo + rviz

On laptop:
  
  roslaunch icclab_turtlebot gmapping_icclab_simulation.launch GAZEBO_GUI:=true

## SLAM with actual Turtlebot

On Turtlebot launch:
  
  roslaunch icclab_turtlebot minimal.launch
  
  roslaunch icclab_turtlebot minimal_amcl.launch map_file:=/home/turtlebot/catkin_ws/src/icclab_turtlebot/icclab_latest_map.yaml initial_pose_x:=-6.2 initial_pose_y:=2 initial_pose_a:=3.50

On laptop:

  roslaunch turtlebot_rviz_launchers view_navigation.launch

