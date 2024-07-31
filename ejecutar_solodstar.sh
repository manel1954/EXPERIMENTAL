#!/bin/bash

sudo systemctl stop ircddbgatewayd.service

# Ejecuta Solo D-STAR 
cd /home/pi/MMDVMHost
sudo ircddbgateway -gui & sudo ./MMDVMDSTAR MMDVMDSTAR.ini

