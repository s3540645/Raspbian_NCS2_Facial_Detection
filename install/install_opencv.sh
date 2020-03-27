#!/bin/bash

wget https://github.com/sol-prog/raspberry-pi-opencv/releases/download/opencv4rpi2.1/opencv-4.1.0-armhf.tar.bz2
tar xvf opencv-4.1.0-armhf.tar.bz2
sudo cp opencv-4.1.0 /opt
rm opencv-4.1.0-armhf.tar.bz2
sudo rm -rf opencv-4.1.0

#install dependancies
sudo apt install libtiff-dev zlib1g-dev -y
sudo apt install libjpeg-dev libpng-dev -y
sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo apt-get install libxvidcore-dev libx264-dev -y
sudo apt install python-numpy python3-numpy -y
sudo apt install libgtk-3-dev libcanberra-gtk3-dev -y

#add to system path
cd ~
echo 'export LD_LIBRARY_PATH=/opt/opencv-4.1.0/lib:$LD_LIBRARY_PATH' >> .bashrc
. .bashrc


#symbolic link for python
sudo ln -s /opt/opencv-4.1.0/lib/python2.7/dist-packages/cv2 /usr/lib/python2.7/dist-packages/cv2
sudo ln -s /opt/opencv-4.1.0/lib/python3.7/dist-packages/cv2 /usr/lib/python3/dist-packages/cv2

#install git
sudo apt install git

#OpenCv config for c++
git clone https://gist.github.com/sol-prog/ed383474872958081985de733eaf352d opencv_cpp_compile_settings
cd opencv_cpp_compile_settings/
sudo cp opencv.pc /usr/lib/arm-linux-gnueabihf/pkgconfig
cd ~
rm -rf opencv_cpp_compile_settings/

#test OpenCV
git clone https://github.com/sol-prog/raspberry-pi-opencv.git
cd raspberry-pi-opencv/tests

#cli C++
g++ cli_cpp_test.cpp -o cli_cpp_test `pkg-config --cflags --libs opencv`
./cli_cpp_test

#gui c++
#g++ gui_cpp_test.cpp -o gui_cpp_test `pkg-config --cflags --libs opencv`
#./gui_cpp_test

#cli python
python3 cli_python_test.py

#gui python
#python3 gui_python_test.py

cd ~
rm -rf raspberry-pi-opencv
















