#!/bin/bash

cd /home/pi/YSFClients/YSFGateway
sudo xterm -geometry 77x6+14+72 -bg brown -fg white -fa 'Serif' -fs 9x -T GATEWAY -e ./YSFGateway YSFGateway.ini & 
cd /home/pi/MMDVMHost
sudo ./MMDVMFUSION MMDVMFUSION.ini
    system("cd /home/pi/A108; xterm -geometry 77x6+14+64 -bg brown -fg white -fa 'Serif' -fs 9x -T SOLOFUSION -e sh ejecutar_solofusion.sh &");


