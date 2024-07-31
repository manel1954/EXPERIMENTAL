#!/bin/bash

# cd /home/pi/YSFClients/YSFGateway
# xterm -geometry 77x6+14+70 -bg brown -fg white -fa 'Serif' -fs 9x -T GATEWAY -e sudo ./YSFGateway YSFGateway.ini &
# cd /home/pi/MMDVMHost
# sudo ./MMDVMFUSION MMDVMFUSION.ini

cd /home/pi/YSFClients/YSFGateway
xterm -geometry 77x5+14+64 -bg black -fg orange -fa ‘verdana’ -fs 9x -T CONSOLA_YSFGateway -e ./YSFGateway YSFGateway.ini & 
cd /home/pi/MMDVMHost
xterm -geometry 77x5+14+165 -bg black -fg orange -fa ‘verdana’ -fs 9x -T CONSOLA_SOLOFUSION -e sudo ./MMDVMFUSION MMDVMFUSION.ini

