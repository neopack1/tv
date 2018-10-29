clear;echo;echo;echo AKTUALIZACJA ZDALNEGO REPOZYTORIUM;sleep 1;clear
#########################################################################################################


git add --all
git commit -a -m 'update'
git push -u origin master


#########################################################################################################
sleep 1;echo;echo;echo ZAKOŃCZONO PRZETWARZANIE SKRYPTU;
sleep 10;clear;echo;echo ZAMYKAM TERMINAL;
sleep 1; exit
