#!/bin/bash

cd /home/pi/YSFClients/YSFGateway
xterm -geometry 77x6+14+72 -bg brown -fg white -fa 'Serif' -fs 9x -T GATEWAY -e sudo ./YSFGateway YSFGateway.ini & 
cd /home/pi/MMDVMHost
sudo ./MMDVMFUSION MMDVMFUSION.ini


