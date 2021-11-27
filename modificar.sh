#!/bin/bash
############################################################
#################     PERSEO DEV TEAM      #################
#################   MENU DE MODIFICACION   #################
#BRUNO:BORDAGORRY#SANDRA:BARRERA#EMILIO:COLINA#VICTOR:DUTRA#
############################################################

clear
until echo $TELEFONO | grep -Eq '^09[1-9][0-9]{6}|[24][0-9]{7}$'
do
clear
echo -e "Primero verifiquemos el codigo del pedido que desea modificar\n"           
echo "Ingrese el telefono del cliente que desea buscar: "
read TELEFONO
done

clear
echo
echo -e "Las compras del cliente $TELEFONO son las siguientes:\n""$(grep -E ":$TELEFONO:" ventas.txt )\n" 
echo "Presione la tecla enter para avanzar a modificar el pedido..."
read p
clear


echo "..:Ingrese el codigo de la venta que desea modificar:.."
read CODIGOBUSCAR

while IFS=: read CODIGO TELEFONO COMBO CANTIDAD IMPORTEFINAL USER FECHA
do
    VENTA="$CODIGO:$TELEFONO:$COMBO:$CANTIDAD:$IMPORTEFINAL:$USER:$FECHA"

    if [ $CODIGOBUSCAR -eq $CODIGO ]
    then

            until echo $NUEVOTELEFONO | grep -Eq '09[1-9][0-9]{6}|[24][0-9]{7}'
            do
                clear
                echo "Ingrese el telefono del cliente[$TELEFONO]:"
                read NUEVOTELEFONO </dev/tty
            done
      
            NUEVOTELEFONO=${NUEVOTELEFONO:-$TELEFONO}
     

        until echo $NUEVOCOMBO | grep -Eq '[1-6]'
        do
            clear
            echo "Ingrese el nuevo codigo del combo [$COMBO]:"
            read NUEVOCOMBO </dev/tty
            NUEVOCOMBO=${NUEVOCOMBO:-$COMBO}
            

        done


        until echo $NUEVACANTIDAD | grep -Eq '[1-9]+$'
        do
            clear
            echo "Ingrese la nueva cantidad de combos pedidos [$CANTIDAD]:"
            read NUEVACANTIDAD </dev/tty
        done


    IMPORTE=$(grep ^$COMBO combos.txt | cut -f3 -d:)
	NUEVOIMPORTEFINAL="$(($IMPORTE*$NUEVACANTIDAD))"

        VENTA="$CODIGO:$NUEVOTELEFONO:$NUEVOCOMBO:$NUEVACANTIDAD:$NUEVOIMPORTEFINAL:$USER:$FECHA"
    fi

    echo $VENTA >> ./nuevasVentas.txt 
done < ./ventas.txt

mv ./nuevasVentas.txt ./ventas.txt

echo "
Pedido Modificado:
Codigo: $CODIGO

Cliente: $NUEVOTELEFONO
Combo: $NUEVOCOMBO
Cantidad: $NUEVACANTIDAD
Importe: $NUEVOIMPORTEFINAL

Vendedor: $USER
Fecha: $FECHA

Presione la tecla enter para continuar:...
"

read p
clear
