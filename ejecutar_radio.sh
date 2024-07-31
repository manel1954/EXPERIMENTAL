#!/bin/bash
cd /home/pi/MMDVMHost
xterm -geometry 77x12+14+64 -bg blue -fg white -fa 'Serif' -fs 9x -T DMO -e sudo ./MMDVMHost MMDVM.ini &

