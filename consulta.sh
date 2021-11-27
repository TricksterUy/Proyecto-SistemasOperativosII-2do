#!/bin/bash
############################################################
#################     PERSEO DEV TEAM      #################
#################    MENU DE CONSULTAS     #################
#BRUNO:BORDAGORRY#SANDRA:BARRERA#EMILIO:COLINA#VICTOR:DUTRA#
############################################################

OPCION=0

while [ $OPCION -ne 9 ]
do
echo "
   ..:MENU DE CONSULTAS:..

1) Cantidad de ventas en un mes
2) Importe total de las compras de un cliente
3) Listado de clientes de un mes
4) Cantidad de ventas de un empleado en un mes
5) Cantidad de ventas totales
6) Total de compras de un cliente en un mes
7) Listado total de compras de un mes
8) Listado de Empleados que trabajan en la Pizzeria
9) Listado de Combos
10) Ver Pedidos Borrados
0) Volver al menu principal
    "

    echo "Ingrese la opcion deseada"
    read OPCION
    case $OPCION in
        1)
            clear
            MES=""

            until echo $MES | grep -Eq '0[1-9]|1[0-2]'
            do
                clear
                echo "Ingrese el mes que desea buscar (2 digitos): "
                read MES
            done

            clear

            echo "Total de ventas del mes $MES:" $(grep -E "/$MES/" ventas.txt | wc -l)
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        2)
            TELEFONO=""

            until echo $TELEFONO | grep -Eq '^09[1-9][0-9]{6}|[24][0-9]{7}$'
            do
                clear
                echo "Ingrese el telefono del cliente que desea buscar: "
                read TELEFONO
            done

            clear

            echo "Importe total de las compras del cliente $TELEFONO: " $(grep -E ":$TELEFONO:" ventas.txt | cut -d ':' -f5 | paste -s -d+ | bc)
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        3)
            clear
            MES=""

            until echo $MES | grep -Eq '0[1-9]|1[012]'
            do
                clear
                echo "Ingrese el mes a buscar (2 digitos): "
                read MES
            done

            clear

            echo "Listado de clientes del mes $MES:"
            echo ""
            grep -E "/$MES/" ventas.txt | cut -d ':' -f2 | uniq | sort
            echo ""
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        4)
            clear
            MES=""
            USUARIO=""

            until echo $USUARIO | grep -Eq '^[a-zA-Z]+$'
            do
                clear
                echo "Ingrese el usuario que desea buscar: "
                read USUARIO
            done

            until echo $MES | grep -Eq '0[1-9]|1[012]'
            do
                clear
                echo "Ingrese el mes a buscar (2 digitos): "
                read MES
            done

            clear

            echo "La cantidad de ventas del $USUARIO en el mes $MES es la siguiente: " $(grep -E "/$MES/" ventas.txt | cut -d ':' -f6 | grep -E "$USUARIO" | wc -l)
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        5)
            clear
            echo "Total de ventas:" $(wc -l ./ventas.txt | cut -d ' ' -f 1)
            echo "Presione la tecla enter para continuar..."
            read p

            clear
        ;;
        6)
            TELEFONO=""
            MES=""

            until echo $TELEFONO | grep -Eq '^09[1-9][0-9]{6}|[24][0-9]{7}$'
            do
                clear
                echo "Ingrese el telefono del cliente que desea buscar: "
                read TELEFONO
            done
            until echo $MES | grep -Eq '0[1-9]|1[012]'
            do
                clear
                echo "Ingrese el mes a buscar (2 digitos): "
                read MES
            done

            clear
            echo "La cantidad de compras del $TELEFONO en el mes $MES es la siguiente: " $(grep -E "/$MES/" ventas.txt | cut -d ':' -f2 | grep -E "$TELEFONO" | wc -l)
            #dejarlo por las dudas sirva imprimir el listado completo y no solo la cantidad echo -e "Las compras del cliente $TELEFONO son las siguientes:\n""$(grep -E ":$TELEFONO:" ventas.txt )\n" 
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        7)
            clear
            MES=""

            until echo $MES | grep -Eq '0[1-9]|1[0-2]'
            do
                clear
                echo "Ingrese el mes que desea buscar (2 digitos): "
                read MES
            done

            clear
            echo -e "Total de ventas del mes $MES:\n""$(grep -E "/$MES/" ventas.txt )\n"

            #echo "Total de ventas del mes $MES:" $(grep -E "/$MES/" ventas.txt | wc -l)
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        8)
            clear
            USUARIOS=""

            echo -e "Listado de Usuarios que ingresaron pedidos en la Pizzeria Don Carlo:\n"
            grep -E ":$USER:" ventas.txt | cut -d ':' -f6 | uniq | sort | cat -n
            echo ""
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;

       9)clear

            echo -e "Listado de Combos:\n""$(cat combos.txt | cut -f2 -d:)\n"  
            echo "Presione la tecla enter para continuar..."
            read p
        ;;
       10)clear

            echo -e "Listado de Pedidos Borrados:\n""$(cat borrados.txt )\n"  
            echo "Presione la tecla enter para continuar..."
            read p
        ;;

       0)exit
        bash main.sh;;
        *) echo "Opcion invalida. Pulse Enter para nueva opcion.";;
    esac

    OPCION=0
    clear
done
