ros2 usage

# ros2 component

```bash
ros2 run rclcpp_components component_container
      ,this will return a container named"/ComponentManager" can listed by "ros2 component list".
ros2 component load /ComponentManager video_structure NSPsqlWriter::PsqlWriter
     ,the last param(plugin_name) is written in the end of cpp code
 ros2 param set /parameter_node psql_parameter_topic FrameFaces
     ,the "parameter_node" place is defined in cpp code,the last paramter ("value") can be anything
ros2 service call /srv_start video_structure/srv/Start
   ,the second parameter ("/srv_start ") is defined in cpp code,the last param can by found by "ros2 service list -t"
```

# change the container name

```bash
ros2 run rclcpp_components component_container --ros-args -r __node:=MyContainer -r __ns:=/nw""
and at the other hand,"ros2 component load /nw/MyContainer video_structure NSPsqlWriter::PsqlWriter"
OR:ros2 component load /nw/MyContainer video_structure NSPsqlWriter::PsqlWriter -r __node:=srx2,

OR:

ros2 run rclcpp_components component_container --ros-args -r __node:=container1
ros2 component load /container1 video_structure NSPsqlWriter::PsqlWriter -r __node:=srx1

tip Question:
whats the difference between "ros2 interface list " and "ros2 service list"
```

# example

### run a frame-faces node

in one terminal to run a frame-faces node:

```bash
ros2 run rclcpp_components component_container --ros-args -r __node:=container1
ros2 component load /container1 video_structure NSPsqlWriter::PsqlWriter -r __node:=faces_node
ros2 param set /faces_node psql_topic FrameFaces
ros2 service call /faces_node/start video_structure/srv/Start
```

in another terminal, run a script to publish FrameFaces:

```bash
#!/bin/bash  -e


while true
do    
 timestamp=$(date +%s)
 ros2 topic pub -1 FrameFaces video_structure/msg/FrameFaces "{video_source_id: vid1,timestamp: $timestamp,faces: [{video_source_id: vid1_son_fake, frame_index: 1,timestamp: 11223344, rect: {x: 100,y: 120, w: 654, h: 321}}]}"
 echo $timestamp
# sleep 1
done
```

### run a frame-jpg node

in one terminal to run a frame-jpg node:

```bash
ros2 run rclcpp_components component_container --ros-args -r __node:=container2
ros2 component load /container2 video_structure NSPsqlWriter::PsqlWriter -r __node:=framejpg_node
ros2 param set /framejpg_node psql_topic FrameJpg
ros2 service call /framejpg_node/start video_structure/srv/Start
```

in another terminal, run a script to publish FrameJpg:

```bash
#!/bin/bash  -e

while true
do    
 timestamp=$(date +%s)
 ros2 topic pub -1 FrameJpg video_structure/msg/FrameJpg "{video_source_id: vid1,timestamp: $timestamp}"
 echo $timestamp
# sleep 1
done
```