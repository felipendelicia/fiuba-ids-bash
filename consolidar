#!/bin/bash
FILENAME="respuesta"
SALIDA=~/EPNro1/salida
ENTRADA=~/EPNro1/entrada
PROCESO=~/EPNro1/procesado
for archivo in "$ENTRADA"/*; do
if [ ! -e "$archivo" ]; then
continue
fi
cat "$archivo" >> "$SALIDA/$FILENAME.txt"
mv "$archivo" "$PROCESO/"
done
