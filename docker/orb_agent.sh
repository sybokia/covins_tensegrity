# run by ./orb_agent.sh k, where k is the agent index

CATKIN_WS=/root/covins_ws
ABS_COVINS=/home/sw/covins_ws/src/covins # absolute path to covins/

docker run \
-it \
--rm \
--net=host \
--volume "${ABS_COVINS}/covins_comm/config/config_comm.yaml:${CATKIN_WS}/src/covins/covins_comm/config/config_comm.yaml" \
--volume "${ABS_COVINS}/orb_slam3/Examples/ROS/ORB_SLAM3/launch/launch_docker_ros_euroc.launch:${CATKIN_WS}/src/covins/orb_slam3/Examples/ROS/ORB_SLAM3/launch/launch_docker_ros_euroc.launch" \
covins \
/bin/bash -c \
        "cd ${CATKIN_WS}; \
         source devel/setup.bash; \
         export ROS_MASTER_URI=http://35.3.34.77:11311/; \
         export ROS_IP=192.168.1.198; \
         roslaunch ORB_SLAM3 launch_docker_ros_euroc.launch ag_n:=${1}"