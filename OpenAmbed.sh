#!/bin/bash
cd /home/pi/release/build/xlx_ambed
#!/bin/bash
# start ambed server
sed -i '26c AMBED=ON' /home/pi/status.ini
sudo rmmod ftdi_sio

sudo rmmod usbserial


sudo xterm -geometry 61x16+249+97 -bg black -fg white -fa 'Serif' -fs 9x -T STICK33_AMBED -e sudo ambed 192.168.1.34 &