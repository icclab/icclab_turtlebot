#!/usr/bin/env python

# this is a dummy node that calls the rosservice '/stop_motor' on shutdown

import rospy
from std_srvs.srv import Empty

def dummy_node():
    rospy.init_node('stop_rplidar_motor', anonymous=False)
    rospy.on_shutdown(call_rosservice_stop_motor)
    while not rospy.is_shutdown():
        rospy.spin()

def call_rosservice_stop_motor():
    rospy.loginfo("Stopping rplidar motor")
    resp = rospy.ServiceProxy('/stop_motor', Empty) # returns an EmptyResponse object
    resp() # make the rosservice call  

if __name__ == '__main__':
    try:
        dummy_node()
    except rospy.ROSInterruptException:
        pass
