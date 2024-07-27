#!/bin/bash
estado_dvswitch=$(awk "NR==18" /home/pi/status.ini)
if [ "$estado_dvswitch" = 'DVSWITCH=ON' ];then

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${BLANCO}"
echo "                  ******************************************"
echo "                  *           Al abrir DMR2NXDN            *"
echo "                  *         ${ROJO}se desactiva DVSWITCH${BLANCO}          *"
echo "                  ******************************************"
echo "${GRIS}"
sleep 3

# Desactiva DVSWITCH 
sed -i "18c DVSWITCH=OFF" /home/pi/status.ini
cd /home/pi/A108
sh stop_dvswitch.sh

# pone marca en ON porque se está utilizando DVSWITCH
sed -i "20c MARCA_DVSWITCH=ON" /home/pi/status.ini

clear

mode=`grep -n -m 1 "^UARTPort=" /home/pi/MMDVMHost/MMDVMDMR2NXDN.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMDMR2NXDN.ini)
puerto=`expr substr $mode 15 14`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DMR2NXDN.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDMR2NXDN.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMR2NXDN.desktop

sudo cp /home/pi/RXF_DMR2NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_DMR2NXDN.desktop

#Escribe en el fichero INFO_NXDN para poner los datos en los iconos INFO TXF  
sed -i "15c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_DMR2NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=75x15 -e sudo sh cerrar_DMR2NXDN.sh'" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2NXDN_ON.png" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "10c Name[es_ES]=Cerrar DMR2NXDN" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "16c DMR2NXDN=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_DMR2NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2NXDN.desktop

cd /home/pi/DMR2NXDN

sudo lxterminal --geometry=75x12 -e ./DMR2NXDN DMR2NXDN.ini & 
cd /home/pi/MMDVMHost
#/home/pi/A108/./qt_info_dmr2nxdn & sudo lxterminal --geometry=75x12 -e ./DMR2NXDN MMDVMDMR2NXDN.ini &
sudo lxterminal --geometry=75x12 -e ./DMR2NXDN MMDVMDMR2NXDN.ini &

cd /home/pi/NXDNClients/NXDNGateway
sudo ./NXDNGateway NXDNGateway.ini

cd /home/pi/Desktop
sudo cp Abrir_DMR2NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=75x15 -e sudo sh ejecutar_DMR2NXDN.sh'" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2NXDN_OFF.png" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "10c Name[es_ES]=Abrir DMR2NXDN" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "16c DMR2NXDN=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_DMR2NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2NXDN.desktop

else

mode=`grep -n -m 1 "^UARTPort=" /home/pi/MMDVMHost/MMDVMDMR2NXDN.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMDMR2NXDN.ini)
puerto=`expr substr $mode 15 14`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DMR2NXDN.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDMR2NXDN.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMR2NXDN.desktop

sudo cp /home/pi/RXF_DMR2NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_DMR2NXDN.desktop

#Escribe en el fichero INFO_NXDN para poner los datos en los iconos INFO TXF  
sed -i "15c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_DMR2NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=75x15 -e sudo sh cerrar_DMR2NXDN.sh'" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2NXDN_ON.png" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "10c Name[es_ES]=Cerrar DMR2NXDN" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "16c DMR2NXDN=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_DMR2NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2NXDN.desktop

cd /home/pi/DMR2NXDN

sudo lxterminal --geometry=75x12 -e ./DMR2NXDN DMR2NXDN.ini & 
cd /home/pi/MMDVMHost
#/home/pi/A108/./qt_info_dmr2nxdn & sudo lxterminal --geometry=75x12 -e ./DMR2NXDN MMDVMDMR2NXDN.ini &
sudo lxterminal --geometry=75x12 -e ./DMR2NXDN MMDVMDMR2NXDN.ini &
cd /home/pi/NXDNClients/NXDNGateway
sudo ./NXDNGateway NXDNGateway.ini

cd /home/pi/Desktop
sudo cp Abrir_DMR2NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=75x15 -e sudo sh ejecutar_DMR2NXDN.sh'" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2NXDN_OFF.png" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "10c Name[es_ES]=Abrir DMR2NXDN" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "16c DMR2NXDN=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_DMR2NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2NXDN.desktop

fi
