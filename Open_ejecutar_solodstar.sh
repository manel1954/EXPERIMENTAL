#!/bin/bash

# Ejecuta Solo D-STAR
cd /home/pi/MMDVMHost
#/home/pi/A108/./qt_info_solodstar & sudo ircddbgateway -gui & sudo ./MMDVMDSTAR MMDVMDSTAR.ini 
sed -i '5c MMDVM=ON' /home/pi/status.ini
sudo ./MMDVMHost MMDVM.ini &
sleep 10
sudo ircddbgateway -gui







