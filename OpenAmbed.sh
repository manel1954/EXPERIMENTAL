#!/bin/bash
cd /home/pi/release/build/xlx_ambed
#!/bin/bash
# start ambed server
sed -i '26c AMBED=ON' /home/pi/status.ini
sudo rmmod ftdi_sio

sudo rmmod usbserial


sudo xterm -geometry 78x12+1290+54 -bg black -fg white -fa 'Serif' -fs 9x -T STICK33_AMBED -e sudo ambed 192.168.1.44 &