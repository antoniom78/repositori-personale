#!/bin/bash

# SORGENTE="/media/antonio/multimedia/"
# DESTINAZIONE="/media/antonio/red1t-nas"
CARTELLA_MOUNT_DEFAULT="/media/antonio/"
LOG_RSYNC="/home/antonio/Scrivania/log.txt"

ls -al $CARTELLA_MOUNT_DEFAULT
echo "Inserisci nome disco sorgente (esempio: multimedia): "
read INPUT_SORGENTE
echo "Inserisci nome disco destinazione (esempio: red1t-nas): "
read INPUT_DESTINAZIONE
echo "Verrà effettuata una simulazione della sincronia, attendere..."
# CARTELLE ESCLUSE
WINDOWS_CESTINO=$CARTELLA_MOUNT_DEFAULT$INPUT_SORGENTE"/""\$RECYCLE.BIN"
WINDOWS_SVI=$CARTELLA_MOUNT_DEFAULT$INPUT_SORGENTE"/""System Volume Information"
# CARTELLE DI ELABORAZIONE
SORGENTE=$CARTELLA_MOUNT_DEFAULT$INPUT_SORGENTE"/"
DESTINAZIONE=$CARTELLA_MOUNT_DEFAULT$INPUT_DESTINAZIONE
echo $SORGENTE $DESTINAZIONE
echo $WINDOWS_CESTINO $WINDOWS_SVI
rsync -a --exclude $WINDOWS_CESTINO --exclude $WINDOWS_SVI --log-file=$LOG_RSYNC --dry-run $SORGENTE $DESTINAZIONE
chmod 777 $LOG_RSYNC
echo "Troverai il log nella cartella Scrivania. Controlla prima di rispondere."
echo "Eseguire REALMENTE LA SINCRONIA? (S-N s-n)?"
read RISPOSTA
if [ "$RISPOSTA" = "S" || "$RISPOSTA" = "s" ]; then
    echo "Procedo"
fi
echo "Nessuna elaborazione eseguita."
# rsync -av --exclude $WINDOWS_CESTINO --exclude $WINDOWS_SVI --log-file=$LOG_RSYNC $SORGENTE $DESTINAZIONE