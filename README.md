# Rasbian_NCS2_Facial_Detection


cd Downloads  <br />
https://github.com/s3540645/Rasbian_NCS2_Facial_Detection.git <br />
cd Rasbian_NCS2_Facial_Detection <br />
chmod +x install_all.sh <br />
/install/.install_all.sh <br />

Enable Camera
---------------
sudo raspi-config. Select interfaces→enable camera. <br />
sudo modprobe bcm2835-v4l2 <br />
reboot <br />


Increase Swap partition size
----------------------------
sudo nano /etc/dphys-swapfile <br />
Change CONF_SWAPSIZE=100 to CONF_SWAPSIZE=2048

To run program(image)
--------------------
openvino_fd_myriad.py

To run the program (video)
----------------------------
python3 openvino_fd_myriad_video.py
