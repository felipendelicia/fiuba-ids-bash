#!/bin/bash
SALIDA=~/EPNro1/salida
ENTRADA=~/EPNro1/entrada
PROCESO=~/EPNro1/procesado

echo "FILENAME: $FILENAME"

if [ ! -f "$SALIDA/$FILENAME.txt" ]; then
	touch "$SALIDA/$FILENAME.txt"
	echo "Archivo de salida inexistente, creando..."
fi

while true; do
	sleep 2

	files=$(ls $ENTRADA)

	for item in $files; do
        	if [ -d "$ENTRADA/$item" ]; then
			continue
		fi
		echo "Archivo añadido $item"
        	cat "$ENTRADA/$item" >> "$SALIDA/$FILENAME.txt"
        	mv "$ENTRADA/$item" "$PROCESO/"
	done
done
