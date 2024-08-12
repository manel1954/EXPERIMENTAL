#!/bin/bash

# sed -i "4c Exec=sh -c 'cd /home/pi/A108; sh cerrar_bm.sh" /home/pi/Abrir_MMDVMBM.desktop
# sed -i "5c Icon=/home/pi/A108/ICONO_BM_ON.png" /home/pi/Abrir_MMDVMBM.desktop
# sed -i "10c Name[es_ES]=Cerrar BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=ON" /home/pi/status.ini

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMBM.ini)
frecuencia=`expr substr $frecuencia 13 9`
sed -i "70c $frecuencia" /home/pi/status.ini

puerto=$(awk "NR==51" /home/pi/MMDVMHost/MMDVMBM.ini)
puerto=`expr substr $puerto 15 14`
sed -i "71c $puerto" /home/pi/status.ini

x=$(awk "NR==90" /home/pi/status.ini)

cd /home/pi/MMDVMHost
xterm -geometry 77x12+$x+64 -bg brown -fg white -fa 'Serif' -fs 9x -T BRANDMEISTER -e sudo ./MMDVMBM MMDVMBM.ini &

 
