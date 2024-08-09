#!/bin/bash
# sudo rm /home/pi/MMDVMHost/*.log
# clear
# #sudo rm /var/log/irc*.log
# sudo rm /home/pi/YSFClients/YSFGateway/*.log
# clear
# sudo rm /home/pi/YSF2DMR/*.log
# clear
# sudo rm /home/pi/DMR2NXDN/*.log
# clear
# sudo rm /home/pi/DMR2YSF/*.log
# clear
# sudo rm /home/pi/NXDNClients/NXDNGateway/*.log

# sudo rm /var/log/*.log
# sudo rm /var/log/dvswitch/Analog*

sudo rm /var/log/mmdvm/MMDVM*

# sudo rm /home/pi/DMRGateway/*.log
# clear
#cd /home/pi/A108
xterm -geometry 77x12+643+64 -bg black -fg white -fa 'Serif' -fs 9x -T BORRANDO_LOGS -e sh borrar_logs.sh &

sleep 5