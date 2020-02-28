#!/bin/bash

source /opt/ros/kinetic/setup.bash
source /home/robot/catkin_ws/devel/setup.bash

stream_func(){
rosrun virtual_cam stream _device:=/dev/video3 _width:=640 _height:=480 _fourcc:=YUYV image:=camera/rgb/image_raw/
}

gst_func(){
gst-launch-1.0 v4l2src device=/dev/video3 do-timestamp=true ! autovideoconvert ! vaapih264enc ! rtph264pay config-interval=1 pt=96 ! udpsink host=janus.robopaas.io port=8004 sync=false
}
# 160.85.37.148
stream_func & sleep 0.5

gst_func && fg

#exec gst-launch-1.0 v4l2src device=/dev/video3 do-timestamp=true ! video/x-raw,width=640,height=480,framerate=30/1 ! autovideoconvert ! vaapih264enc ! rtph264pay config-interval=1 pt=96 ! udpsink host=160.85.37.148 port=8004 sync=false

