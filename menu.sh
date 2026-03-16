#!/bin/bash

opcion=-1

if [ "$1" == "-d" ]; then
	rm -rf ~/EPNro1
fi

while true
do
	echo "1) Crear entorno"
	echo "2) Opcion 2"
	echo "3) Opcion 3"
	echo "4) Opcion 4"
	echo "5) Opcion 5"
	echo "6) Salir"
	echo -n "Seleccione una opcion: "
	read opcion

	case $opcion in
        	1) 
                	echo "Opcion 1 elegida, creando entorno."
                	mkdir -p ~/EPNro1
                	mkdir -p ~/EPNro1/entrada
                	mkdir -p ~/EPNro1/salida
                	mkdir -p ~/EPNro1/procesado
                	;;
        	2)
                	echo "Opcion 2 elegida"
                	;;
        	3)
                	echo "Opcion 3 elegida"
                	;;
        	4)
                	echo "Opcion 4 elegida"
                	;;
        	5)
					echo "Opcion 5 elegida"
                	;;
        	6)
                	echo "Opcion 6 elegida, saliendo."
					break
        	        ;;
			*)
					echo "Opcion invalida"
	esac
	
done
