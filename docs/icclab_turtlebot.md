# ICCLab Turtlebot HW description

## Turtlebot 2

## HW components

We use the following components:

* Kobuki base
* Ms Kinect
* Robopeak laser scanner (https://github.com/robopeak/rplidar_ros)
* Raspberry Pi3
* Pi Camera

## Power connections

In order to power the Pi3, we use the Kobuki base.

A Pi3 requires 5.1V and 1A, but 2.5 A is recommended ((https://www.raspberrypi.org/documentation/hardware/raspberrypi/power/README.md)

We could have directly used the 5V 1A port on the back of the Kobuki base (https://media.readthedocs.org/pdf/iclebo-kobuki/latest/iclebo-kobuki.pdf), but wanted to make sure to have sufficient power for USB devices, so we ended up using the 12V 1.5A port instead and converting to standar USB power.

![Kobuki connectors](kobuki_connectors.png  "Kobuki connectors")

We built a cable with these parts:
- 1x molex 39-01-3028 (casing), e.g. from Distrelec
- 2x molex 45750-1112 (connectors)
- 1x standard USB power supply for car lighters (in: 12V out: 5V 2.1 A)
- 1x standard car lighter cable + female plug (e.g. https://www.conrad.ch/de/tru-components-kfz-buchse-mit-schutzkappe-belastbarkeit-strom-max10-a-1564142.html)

