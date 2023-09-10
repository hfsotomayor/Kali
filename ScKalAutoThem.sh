#!/bin/bash

# Define los nombres de tus temas diurno y nocturno
TEMA_DIA="Kali-Light"  #Definir tu propio Tema
TEMA_NOCHE="Kali-Dark" #Definir tu propio Tema 

# Define los nombres de tus temas diurno y nocturno para el administrador de ventanas
TEMA_DIA_WM="Kali-Light" #Definir tu propio Tema
TEMA_NOCHE_WM="Kali-Dark" #Definir tu propio Tema

# Define las rutas a tus imágenes de fondo de pantalla diurna y nocturna
FONDO_DIA="/kali-cubism-Grey-16x9Ligth.jpg"  #define el path correcto donde tienes tu imagen
FONDO_NOCHE="/kali-cubism-Grey-16x9Darck.jpg" #define el path correcto donde tienes tu imagen

# Obtiene la hora actual
HORA=$(date +%H)

# Define las horas de inicio del día y la noche
DIA_INICIO=7  #define tu propiro horario 
NOCHE_INICIO=19 #define el path correcto donde tienes tu imagen

# Comprueba si es de día o de noche y cambia el tema en consecuencia
if [ $HORA -ge $DIA_INICIO ] && [ $HORA -lt $NOCHE_INICIO ]; then
    gsettings set org.gnome.desktop.interface gtk-theme $TEMA_DIA  # cambia al tema diurno de Gnome
    xfconf-query -c xsettings -p /Net/ThemeName -s $TEMA_DIA # cambia al tema diurno de XFCE
    xfconf-query -c xfwm4 -p /general/theme -s $TEMA_DIA_WM # cambia al gestor de ventana diurno de XFCE
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s $FONDO_DIA # cambia al fondo de pantallas  diurno de XFCE, puede cambiar el path dependiendo de la configuracion de monitor que tengas
else
    gsettings set org.gnome.desktop.interface gtk-theme $TEMA_NOCHE # cambia al tema nocturno de Gnome
    xfconf-query -c xsettings -p /Net/ThemeName -s $TEMA_NOCE # cambia al tema nocturno de XFCE
    xfconf-query -c xfwm4 -p /general/theme -s $TEMA_NOCHE_WM # cambia al gestor de ventana nocturno de XFCE
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s $FONDO_NOCHE # cambia al fondo de pantallas  nocturno de XFCE, puede cambiar el path dependiendo de la configuracion de monitor que tengas
fi