#!/bin/bash

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
frecuencia=`expr substr $frecuencia 13 9`
sed -i "80c $frecuencia" /home/pi/status.ini

puerto=$(awk "NR==51" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
puerto=`expr substr $puerto 15 14`
sed -i "81c $puerto" /home/pi/status.ini


sudo systemctl stop ircddbgatewayd.service

# Ejecuta Solo D-STAR 
cd /home/pi/MMDVMHost
sudo ircddbgateway -gui & sudo ./MMDVMDSTAR MMDVMDSTAR.ini

