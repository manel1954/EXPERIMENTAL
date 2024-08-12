#!/bin/bash


puerto_router=$(awk "NR==1" /home/pi/.local/ambe_server.ini) 
puerto_modem=$(awk "NR==2" /home/pi/.local/ambe_server.ini)
baut_rate=$(awk "NR==3" /home/pi/.local/ambe_server.ini)
cd /home/pi/AMBEServer
sudo xterm -geometry 77x12+1287+62 -bg black -fg white -fa 'Serif' -fs 9x -T AMBE_SERVER -e sudo ./AMBEserver -p $puerto_router -i $puerto_modem -s $baut_rate &
sudo sed -i '26c AMBE=ON' /home/pi/status.ini