#!/bin/bash

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
frecuencia=`expr substr $frecuencia 13 9`
sed -i "80c $frecuencia" /home/pi/status.ini

puerto=$(awk "NR==51" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
puerto=`expr substr $puerto 15 14`
sed -i "81c $puerto" /home/pi/status.ini

x=$(awk "NR==94" /home/pi/status.ini)

# # Ejecuta Solo D-STAR 
# # sudo systemctl stop ircddbgatewayd.service
# sudo ircddbgateway -gui &

# cd /home/pi/MMDVMHost
# xterm -geometry 76x10+$x+764  -bg black -fg cyan -fa 'arial' -fs 10x -T SOLO_DSTAR -e sudo ./MMDVMDSTAR MMDVMDSTAR.ini &

sudo systemctl stop ircddbgateway.service

# Ejecuta Solo D-STAR 
sudo ircddbgateway -gui &
cd /home/pi/MMDVMHost
xterm -geometry 76x10+$x+764  -bg black -fg cyan -fa 'arial' -fs 10x -T SOLO_DSTAR -e sudo ./MMDVMDSTAR MMDVMDSTAR.ini

