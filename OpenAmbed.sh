#!/bin/bash
#cd /home/pi/release/build/xlx_ambed
#!/bin/bash
# start ambed server
sed -i '26c AMBE=ON' /home/pi/status.ini
# sudo rmmod ftdi_sio

# sudo rmmod usbserial

cd /home/pi/AMBEServer
sudo xterm -geometry 77x12+1287+62 -bg black -fg white -fa 'Serif' -fs 9x -T AMBE_SERVER -e sudo ./AMBEserver -p 24600 &