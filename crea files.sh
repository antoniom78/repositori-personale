#!/bin/bash

# CREA FILE VUOTI da 64 Bytes ogni 1 minuti MAIN
PERCORSO="/home/antonio/Scrivania/test/"
NOME_FILE="Antonio MELI "
for ((k=1;k<=5;k+=1)); do # CICLO CHE NUMERA I FILE
 for ((i=1;i<=4;i+=1)); do # CICLO CHE NUMERA LE COPIE DI OGNI FILE DI CUI SOPRA (CICLO k)
  NOME_TEMP="$PERCORSO""Copy $i of ""$NOME_FILE""$k"
  dd if=/dev/zero of="$NOME_TEMP" bs=64 count=1
  sleep 1m
 done
done
