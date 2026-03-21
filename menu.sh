#!/bin/bash
parametro=$1
if [ "$parametro" == "-d" ] ; then
pkill -f consolidar.sh
rm -rf ~/EPNro1
exit 0
fi

while true
do

echo "1- Crear Contorno"
echo "2- Correr proceso"
echo "3- Salida"
read respuesta
case $respuesta in

1)

mkdir -p ~/EPNro1/entrada
mkdir -p ~/EPNro1/salida
mkdir -p ~/EPNro1/procesado

echo "Se creo el entorno"

;;

2)
bash ~/EPNro1/consolidar.sh &
echo "Se corre el proceso"
;;

3)
echo "Se salió"
exit 0

;;

*)
echo "opcion no valida"
;;
esac
done

