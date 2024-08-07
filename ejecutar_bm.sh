#!/bin/bash

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMBM.ini)
frecuencia=`expr substr $frecuencia 13 9`
sed -i "70c $frecuencia" /home/pi/status.ini
sed -i '7c MMDVMBM=ON' /home/pi/status.ini
puerto=$(awk "NR==51" /home/pi/MMDVMHost/MMDVMBM.ini)
puerto=`expr substr $puerto 15 14`
sed -i "71c $puerto" /home/pi/status.ini

cd /home/pi/MMDVMHost
xterm -geometry 77x12+14+64 -bg brown -fg white -fa 'Serif' -fs 9x -T BRANDMEISTER -e sudo ./MMDVMBM MMDVMBM.ini &


