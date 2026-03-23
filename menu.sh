#!/bin/bash

opcion=-1
directorio_base="$HOME/EPNro1"
ruta_archivo_salida="$directorio_base/salida/$FILENAME.txt"

if [ "$1" = "-d" ]; then
	echo "Eliminando entorno..."
	rm -rf ~/EPNro1
	pkill -f consolidar.sh
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
                        ruta_consolidar="$directorio_base/consolidar.sh"

                        if [ ! -f "$ruta_consolidar" ]; then
                        	cp ./consolidar.sh "$ruta_consolidar"
			fi
			
			(sh "$ruta_consolidar") &
			
                	;;
        	3)
                	echo "Opcion 3 elegida"
                    if [ -f "$ruta_archivo_salida" ]; then
                        sort -nk 1 "$ruta_archivo_salida" # Ordena númericamente -n desde la columna -k=1 el número de legajo
                    else
                        echo "Error: El archivo no existe"
                    fi    
                    ;;
        	4)
                	echo "Opcion 4 elegida"
                    if [ -f "$ruta_archivo_salida" ]; then
                        #sort -nrk 5 FILENAME.txt | head -n 10 # NO CONTEMPLA SI EN UNA LINEA HAY 6 COLUMNAS
                        awk '{print $NF, $0}' "$ruta_archivo_salida" | sort -nr | cut -d' ' -f2- | head -n 10
                    else
                        echo "Error: El archivo no existe"
                    fi
                	;;
        	5)
			echo "Opcion 5 elegida"
                        read -p "Ingresar padron: " padron

                        if [ -f "$ruta_archivo_salida" ]; then
                        	grep "$padron" "$ruta_archivo_salida"
                    	else
                        	echo "Error: El archivo de resultados no existe aún."
			fi
                	;;
        	6)
                	echo "Opcion 6 elegida, saliendo."
					break
        	        ;;
			*)
					echo "Opcion invalida"
	esac
	
done
