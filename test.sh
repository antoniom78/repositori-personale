#!/bin/bash

# VARIABILI FILE DI LOG E PERCORSI DI SALVATAGGIO
MAIL_FROM_NAME=$(hostname)
SOURCE_ARCHIVIO="/home/antonio/Scrivania/archivio/"
WORK_DIR="/home/antonio/github/erga-script-nas/"

# MAIN ***************************************************************

find $SOURCE_ARCHIVIO. -type d | sed '1,1d' > listDtmp # CERCA SOLO CARTELLE IN FILE TMP
str_del_var=$(($(expr length $SOURCE_ARCHIVIO)+2)) # CALCOLA NUMERO CARATTERI DA ESTRARRE PER OGNI LINEA
cat /dev/null > listD # AZZERA IL FILE
# ROUTINE PER ELIMINARE DA OGNI INIZIO RIGA IL PERCORSO SOURCE_ARCHIVIO + ./
while read -r linea; do
	echo ${linea:str_del_var} >> listD
done < listDtmp
rm listDtmp
# FINE ROUTINE
echo "Elenco cartelle in $SOURCE_ARCHIVIO"
cat listD

cat /dev/null > listFtmp # AZZERA IL FILE
cat /dev/null > listF # AZZERA IL FILE
while read -r lineD; do
	echo -e "------------------------\n$SOURCE_ARCHIVIO\n$lineD\n" >> listFtmp
	find "$SOURCE_ARCHIVIO$lineD/." -maxdepth 1 -type f >> listFtmp
	while read -r lineF; do
		echo ${lineF#"/./"} >> listF
	done < listFtmp
done < listD

cat listFtmp
cat listF
