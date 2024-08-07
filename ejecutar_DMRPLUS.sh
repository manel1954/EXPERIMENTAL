#!/bin/bash
status_dmrplus="NR==6" /home/orangepi/.local/autoarranque.ini)

if [ "$status_dmrplus" = "DMR+=ON" ];then
sed -i "4c Exec=sh -c 'cd /home/pi/A108; sh cerrar_DMRPLUS.sh" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/A108/ICONO_DMRPLUS_ON.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=Cerrar DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
#sed -i "16c MMDVMPLUS=ON" /home/pi/status.ini
else
echo ""
fi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frecuencia=`expr substr $frecuencia 13 9`
sed -i "72c $frecuencia" /home/pi/status.ini

puerto=$(awk "NR==51" /home/pi/MMDVMHost/MMDVMPLUS.ini)
puerto=`expr substr $puerto 15 14`
sed -i "73c $puerto" /home/pi/status.ini

x=$(awk "NR==90" /home/pi/status.ini)

cd /home/pi/MMDVMHost
xterm -geometry 77x12+$x+64 -bg black -fg white -fa 'Serif' -fs 9x -T DMR_PLUS -e sudo ./MMDVMPLUS MMDVMPLUS.ini &


