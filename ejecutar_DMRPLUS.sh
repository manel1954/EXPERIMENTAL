#!/bin/bash

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frecuencia=`expr substr $frecuencia 13 9`
sed -i "72c $frecuencia" /home/pi/status.ini

puerto=$(awk "NR==51" /home/pi/MMDVMHost/MMDVMPLUS.ini)
puerto=`expr substr $puerto 15 14`
sed -i "73c $puerto" /home/pi/status.ini

cd /home/pi/MMDVMHost
xterm -geometry 77x12+14+64 -bg black -fg white -fa 'Serif' -fs 9x -T DMR_PLUS -e sudo ./MMDVMPLUS MMDVMPLUS.ini &

