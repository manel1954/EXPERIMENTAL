#!/bin/bash
#Lee en el fichero INFO_RXF para poner los datos en el icono INFO TXF
frecuencia=$(awk "NR==1" /home/pi/INFO_RXF)

onoff=$(awk "NR==7" /home/pi/status.ini)
if [ $onoff = MMDVMBM=ON ]
then
# Botón  Abrir BM ON
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=BRANDMEISTER -e sudo sh cerrar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_BM_ON.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=Cerrar BM" /home/pi/Abrir_MMDVMBM.desktop
cd /home/pi

sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMBM.desktop

else
# Botón  Abrir BM OFF
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMBM.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=77x18 --title=BRANDMEISTER -e sudo sh ejecutar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_BM_OFF.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=Abrir BM" /home/pi/Abrir_MMDVMBM.desktop
cd /home/pi

sudo cp Abrir_MMDVMBM.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMBM.desktop
fi


# Elegir icono Editar BM
cd /home/pi/Desktop
sudo cp Editar_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_editor_bm'" /home/pi/Editar_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_EDITAR_BM.png" /home/pi/Editar_MMDVMBM.desktop
sed -i "11c Name[es_ES]=Editar BM" /home/pi/Editar_MMDVMBM.desktop

cd /home/pi
sudo cp Editar_MMDVMBM.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_MMDVMBM.desktop

# Elegir icono Editar info BM
cd /home/pi/Desktop
sudo cp RXF_BM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;./qt_info_bm'" /home/pi/RXF_BM.desktop
sed -i "6c Icon=/home/pi/$SCRIPTS_version/ICONO_INFO.png" /home/pi/RXF_BM.desktop
sed -i "12c Name[es_ES]=$frecuencia" /home/pi/RXF_BM.desktop

cd /home/pi
sudo cp RXF_BM.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_BM.desktop

