#!/bin/bash

mode=$(awk "NR==77" /home/pi/MMDVMHost/MMDVM.ini)
puerto=`expr substr $mode 15 14`

frecuencia=$(awk "NR==76" /home/pi/MMDVMHost/MMDVM.ini)
frecuencia=`expr substr $frecuencia 13 9`

cd /home/pi/MMDVMHost
xterm -geometry 77x12+14+64 -bg blue -fg white -fa 'Serif' -fs 9x -T DMO -e sudo ./MMDVMHost MMDVM.ini &

