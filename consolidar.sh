#!/bin/bash
SALIDA=~/EPNro1/salida
ENTRADA=~/EPNro1/entrada
PROCESO=~/EPNro1/procesado

if [ ! -f "$SALIDA/$FILENAME.txt" ]; then
	touch "$SALIDA/$FILENAME.txt"
fi

while true; do
	sleep 3

	files=$(ls $ENTRADA)

	for item in $files; do
        if [ -d "$ENTRADA/$item" ]; then
			continue
		fi
        cat "$ENTRADA/$item" >> "$SALIDA/$FILENAME.txt"
        mv "$ENTRADA/$item" "$PROCESO/"
	done
done
