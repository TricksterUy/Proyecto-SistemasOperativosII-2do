#!/bin/bash

############################################################
#################     PERSEO DEV TEAM      #################
#################      MENU PRINCIPAL      #################
#BRUNO:BORDAGORRY#SANDRA:BARRERA#EMILIO:COLINA#VICTOR:DUTRA#
############################################################

##################################################################################
#Funcion LOG                                                                     #
                                                                                 #
# Fecha y hora del script, se usa para el log.                                   #
DATE=`date +%F`                                                                  #
TIME=`date +%H:%M`                                                               #
                                                                                 #
# Ruta del fichero de LOG                                                        #
LOG="Pizzeria_$DATE.log"                                                         #
                                                                                 #
echo "Se inicio el Script el día $DATE a las $TIME por el usuario $USER">>$LOG   #
                                                                                 #
##################################################################################


OPCION=0
tput setaf 3
touch "./ventas.txt"

clear
while [ $OPCION -ne 5 ];
do

echo "                    
                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⣶⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀
                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣷⣤⠀⠈⠙⢿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀
                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⠆⠰⠶⠀⠘⢿⣿⣿⣿⣿⣿⣆⠀⠀⠀
                    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⠏⠀⢀⣠⣤⣤⣀⠙⣿⣿⣿⣿⣿⣷⡀⠀
                    ⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⢈⣉⠉⣡⣤⢰⣿⣿⣿⣿⣿⣷⡈⢿⣿⣿⣿⣿⣷⡀
                    ⠀⠀⠀⠀⠀⠀⠀⡴⢡⣾⣿⣿⣷⠋⠁⣿⣿⣿⣿⣿⣿⣿⠃⠀⡻⣿⣿⣿⣿⡇
                    ⠀⠀⠀⠀⠀⢀⠜⠁⠸⣿⣿⣿⠟⠀⠀⠘⠿⣿⣿⣿⡿⠋⠰⠖⠱⣽⠟⠋⠉⡇
                    ⠀⠀⠀⠀⡰⠉⠖⣀⠀⠀⢁⣀⠀⣴⣶⣦⠀⢴⡆⠀⠀⢀⣀⣀⣉⡽⠷⠶⠋⠀
                    ⠀⠀⠀⡰⢡⣾⣿⣿⣿⡄⠛⠋⠘⣿⣿⡿⠀⠀⣐⣲⣤⣯⠞⠉⠁⠀⠀⠀⠀⠀
                    ⠀⢀⠔⠁⣿⣿⣿⣿⣿⡟⠀⠀⠀⢀⣄⣀⡞⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀
                    ⠀⡜⠀⠀⠻⣿⣿⠿⣻⣥⣀⡀⢠⡟⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                    ⢰⠁⠀⡤⠖⠺⢶⡾⠃⠀⠈⠙⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                    ⠈⠓⠾⠇
"

echo "
               ...:PIZZERIA DON CARLO:...

          ..:Bienvenido al sistema de pedidos:..

1) Ingrese un Nuevo Pedido
2) Modificar un Pedido ya Ingresado
3) Eliminar Pedido ya Ingresado
4) Consultas y Estadisticas
5) Menu de Ayuda
6) Salir
"

echo Ingrese la opcion deseada
read OPCION
case $OPCION in

    1) clear
    bash alta.sh;;
    2) 
    bash modificar.sh;;
    3) clear
    bash baja.sh;;
    4) clear
    bash consulta.sh;;
    5) clear
    bash dudas.sh;;
    6) exit;;
    *) echo "Opcion invalida, presione Enter para una nueva opcion"
    read -n1
esac
OPCION=0
clear
done
echo "Salir del programa..."
sleep 4
