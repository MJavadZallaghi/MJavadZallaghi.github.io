---
layout: post
title: Docker with GPU-access for Robotics
date: 2024-08-07
author: Mohammad Javad Zallaghi
---

#Roboticists would like to create robots, simulate them, develop their software, then deploy on the hardware.

In hashtag#ROS 2 ecosystem, for simulation, we use hashtag#Gazebo. But you may ask, how to model the robot and import it in Gazebo?

🐢 For modelling the robot, we use URDF format. It's kind of xml file that describe the links, joints, geometry, and collision elements of the robot. 

🤷‍♂️ Should you create the URDF manually? Definitely no — doing that manually is not possible. So, what is the solution for creating URDFs and loading the robot in Gazebo? I have the answer if you are intersted in using CAD for creating your robot simulation.

🌱 I've done it, you can see the images from CAD, to ROS 2 package, and finally the Gazebo simulation (see the attached images). 

![Access to the GPU inside the docker container](/assets/images/gpu_inside_docker.png)

This is my instruction for creating the URDF and Gazebo simulation for your robot:

1. CAD:

 1.1: Model the parts of your robot using FreeCAD software and its part design workbench.

 1.2: Define proper LCS (local coordinate frame) on each part where the joint will be defined later.

2. URDF and ROS2:

 2.1: Install FreeCAD.CROSS workbench inside FreeCAD. It's a tool for easy URDF generation from your robot.

 2.2: Define the links using CROSS. Add created parts of your robot to the links.

 2.3: Define the joints using CROSS. Define parent and child links, and the position of the joint.

 2.4: Define the robot material in created robot object from CROSS and use the CROSS tool for mass and inertial property calculator of the link.

 2.5: Export ROS 2 package of your robot modelled using FreeCAD and CROSS. It will create the URDF, mesh files, and Gazebo and hashtag#Rviz launch files for your robot.

3. Simulation:

3.1: Move the generated ROS 2 package to your ROS2 work space.

3.2: Build the package using colcon build.

3.3: Launch the Gazebo launch file of the package.

3.4: Enjoy your simulation and echo state of the joints of the robot using ```ros2 topic echo /joint_states```

✅ If you are interested to learn this by a YouTube video, give me a comment to create it for you. 😊