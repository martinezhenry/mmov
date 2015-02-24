# se forma el nombre del archivo
DA=`date +%d`
MES=`date +%m`
ANO=`date +%Y`
HOR=`date +%H`
ARCHIVO=backup_$ANO-$MES-$DA.sql
mysqldump --opt --password=12345 --user=root mmov > $ARCHIVO
