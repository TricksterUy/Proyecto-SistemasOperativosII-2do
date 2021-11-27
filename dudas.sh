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
           ..:MENU DE AYUDA:..
...:BIENVENIDO A LA PIZZERIA DON CARLO:...

En el presente encontraras las explicaciones necesarias
para ayudarte a utilizar el programa de la mejor manera posible

1) Ingreso de Pedidos
2) Eliminacion de Pedidos
3) Modificacion de Pedidos
4) Menu sobre Consultas y Estadisticas
5) Volver al menu principal
    "

    echo "Ingrese la opcion deseada"
    read OPCION
    case $OPCION in
        1)
            clear
            
            echo "...:MENU DE AYUDA SOBRE EL INGRESO DE PEDIDOS:..."
            echo
            echo "En la opcion de ingresar pedidos deberas respetar un esquema de ingresos:

a)-Telefono del Cliente: Respetando el rango que si es celular comienza con 09 y si es telefono fijo, debe comenzar por 2 (Montevideo) o 4 (Interior)
Ingresa 9 numeros para celular y 8 numeros para telefonos.

b)-Combo: Tendras un Resumen en pantalla de los combos que se venden en la Pizzeria, simplemente, deberas ingresar el numero del combo que el cliente
solicite en dicha opcion y continuar.

c)-Cantidad: En esta opcion, simplemente, ingresaras el total de combos que el cliente quiera comprar, nada mas, nada menos.

Una vez ingresadas las opciones, el programa calculara de manera automatica el importe total del pedido y el mismo sera almacenado conjuntamente con los
datos ingresados anteriormente, tambien se le asignara a cada pedido un codigo de manera automatica, esto es para facilitarte la busqueda en caso de 
que quieras realizar consultas, eliminar pedidos, modificarlos y/o ver las estadisticas actuales.

Paso final, dando enter, vuelves al menu principal de la Pizzeria
"
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        2)
            clear
            
            echo "...:MENU DE AYUDA SOBRE ELIMINAR DE PEDIDOS:..."
            echo
            echo "En la opcion de eliminar pedidos al iniciar (en caso de no recordarlo) podras buscar los pedidos de el cliente que desees.
Para ello, al inicio, se te pedira el numero de telefono/celular del cliente que desees buscar, esto te mostrara por pantalla la cantidad
de pedidos realizados por el usuario que ingresaste y el codigo del pedido asignado a esa compra.

Una vez que obtengas el codigo del pedido (el numero inicial de cada linea) el programa te pedira dicho codigo de la venta de la cual deseas 
eliminar, una vez que lo ingreses, para prevenir errores, te dara dos opciones borrar si o no, ten cuidado por que una vez eliminado, los datos
desapareceran del listado de ventas.

Paso final, dando enter, vuelves al menu principal de la Pizzeria"

            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        3)
            clear
            
            echo "...:MENU DE AYUDA SOBRE MODIFICACION DE PEDIDOS:..."
            echo
            echo "En la opcion de modificar pedidos tambien al iniciar (en caso de no recordarlo) podras buscar los pedidos de el cliente que desees.
Para ello, al inicio, se te pedira el numero de telefono/celular del cliente que desees buscar, esto te mostrara por pantalla la cantidad
de pedidos realizados por el usuario que ingresaste y el codigo del pedido asignado a esa compra.
Una vez que obtengas el codigo del pedido (el numero inicial de cada linea) el programa te pedira dicho codigo de la venta de la cual deseas 
modificar, una vez que lo ingreses, se te desplegaran opciones similares al ingreso de pedidos, solo que en esta ocacion modificaras los campos
que previamente ingresaste, el codigo del pedido NO se modifica bajo ningun concepto, ya que cada venta lleva un codigo asignado, lo que si se 
modifican son los campos que ingresaste anteriormente, telefono, combo y cantidad de combos, de igual forma que en el ingreso, una vez que termines
de modificar, te mostrara en pantalla los datos que seran almacenados en la base de datos de la Pizzeria.
Lo bueno, es que previo a modificar lo que sea, arriba sobre parentesis rectos, podras ver los datos que ya habias ingresado anteriormente, asi
se evitan errores. Esta opcion es muy util si por algun motivo te equivocaste en algun pedido o si el cliente cambio de parecer en cuento al combo
seleccionado o la cantidad del mismo. En caso de que no se desee modificar nada, luego de buscar el numero del cliente y a posterior que pida el 
codigo de pedido a modificar, debera ingresar el numero 0 seguido de enter.

Paso final, dando enter, vuelves al menu principal de la Pizzeria
"
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
        4)
            clear
            
            echo "...:MENU DE AYUDA SOBRE CONSULTAS Y/O ESTADISTICAS:..."
            echo
            echo "Esta  opcion, es una de las mas completas en cuanto a las consultas, aqui podras consultar pedidos ingresados, las compras del 
cliente que desees buscar en cierto mes, las ventas de los empleados de la Pizzeria, las ventas de cierto mes, el listado de clientes, las ventas
totales y el listado de los combos entre otras tantas opciones este menu sirve principalmente para llevar las estadisticas de la Pizzeria Don Carlo
pero sientete libre de consultar lo que creas necesario.

Paso final, dando enter, vuelves al menu principal de la Pizzeria
"
            echo "Presione la tecla enter para continuar..."
            read p
            clear
        ;;
       5)exit
        bash main.sh;;
        *) echo "Opcion invalida. Pulse Enter para nueva opcion.";;
    esac

    OPCION=0
    clear
done
