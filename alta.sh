#!/bin/bash
############################################################
#################     PERSEO DEV TEAM      #################
#################       MENU DE ALTA       #################
#BRUNO:BORDAGORRY#SANDRA:BARRERA#EMILIO:COLINA#VICTOR:DUTRA#
############################################################

clear

CODIGOINICIAL=1

CODIGO=$(cut -d: -f 1 ventas.txt | sort -n | tail -n1) 
CODIGO=$(($CODIGO+$CODIGOINICIAL))

until echo $TELEFONO | grep -Eq '09[1-9][0-9]{6}|[24][0-9]{7}'
do
    clear
    echo "Ingrese el celular o telefono del cliente:"
    read TELEFONO
done

until echo $COMBO | grep -Eq '[1-6]'
do
    clear
echo "Elija uno de los siguientes Combos de la Casa:"
echo
echo -e "Listado de Combos:\n""$(cat combos.txt | cut -f2 -d: )\n" 
    echo
    echo -e "Ingrese el codigo del Combo solicitado:\n "
    read COMBO
IMPORTE=$(grep ^$COMBO combos.txt | cut -f3 -d:)

done

until echo $CANTIDAD | grep -Eq '[1-9]+$'
do
    clear
    echo "Ingrese la cantidad de Combos pedidos:"
    read CANTIDAD
done


#Calcular el importe total del pedido

IMPORTEFINAL="$(($IMPORTE*$CANTIDAD))"

#Poner usuario del sistema y fecha automaticamente
FECHA=$(date +"%d/%m/%Y")

echo "$CODIGO:$TELEFONO:$COMBO:$CANTIDAD:$IMPORTEFINAL:$USER:$FECHA" >> ventas.txt

clear

echo "
Nuevo pedido ingresado:
Codigo: $CODIGO

Cliente: $TELEFONO
Combo: $COMBO
Cantidad: $CANTIDAD
Importe: $IMPORTEFINAL

Vendedor: $USER
Fecha: $FECHA

Presione enter para continuar:...
"

read p
clear
