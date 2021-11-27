#!/bin/bash
############################################################
#################     PERSEO DEV TEAM      #################
#################       MENU DE BAJA       #################
#BRUNO:BORDAGORRY#SANDRA:BARRERA#EMILIO:COLINA#VICTOR:DUTRA#
############################################################

BORRAR=0

clear
until echo $TELEFONO | grep -Eq '^09[1-9][0-9]{6}|[24][0-9]{7}$'
do
clear
echo -e "Primero verifiquemos el codigo del pedido que desea eliminar\n"           
echo "Ingrese el telefono del cliente que desea buscar
el listado le arrojara el total del pedidos del cliente solicitado: "
read TELEFONO
done

clear
echo
echo -e "Las compras del cliente $TELEFONO son las siguientes:\n""$(grep -E ":$TELEFONO:" ventas.txt )\n" 
echo "Presione la tecla enter para avanzar a modificar el pedido..."
read p
clear

echo " "
read -p "..:Ingrese el codigo de la venta que desea borrar:.. " CODIGO
BUSCAR=$(grep -w "^$CODIGO" ventas.txt)

if ! [ -z $BUSCAR ]
then
    echo "

         "
    echo "Esta seguro que desea eliminar el pedido? (1:Si / 2:No)"
    until echo $BORRAR | grep -Eq '[1,2]'
    do
        read BORRAR
    done
    if [ "$BORRAR" -eq 1 ]
    then
        grep -vw "^$CODIGO" ventas.txt > nuevasventas.txt
        grep -w "^$CODIGO" ventas.txt >> borrados.txt
        mv nuevasventas.txt ventas.txt
        echo "Pedido Nro $CODIGO Borrado"
        sleep 3
    else
        if [ "$BORRAR" -eq 2 ]
        then
            echo "Pedido Nro $CODIGO No Borrado"
            sleep 3
        fi        
    fi
else
    #Si no se encuentra nada le damos aviso al usuario
    echo "
            No se encontro el codigo $CODIGO..."
    sleep 4
fi


