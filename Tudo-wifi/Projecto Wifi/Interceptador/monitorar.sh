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
echo -e $blue  "                                                     "
echo -e $blue  "                                                          EMAIL:casteloabraao@gmail.com"

echo -e $purple "Carregando..."
printf "\n"
sleep 5
}
reset
logo  
   whiptail --title "Placa em monitor" --msgbox "Activando placa em modo Monitor " --fb 10 60

     ifac=$(whiptail --title "Interface" --inputbox "Digite a interface: " --fb 10 60 3>&1 1>&2 2>&3)
     if [ $? = 0 ];then
         airmon-ng start $ifac
      else

       echo "interface cancelada.."
     fi
printf "\n"
echo -e $yellow "  ------------------------------------------------------------------"
echo -e $yellow " |                                                                  |"
echo -e $yellow " |              Digite 1 para Escutar todas redes                   |"
echo -e $yellow " |             Digite 2 para Escutar apenas um cliente              |"
echo -e $yellow " |                                                                  |"
echo -e $yellow "  ------------------------------------------------------------------ "
 printf "\n"
      read -p "$terminal " x

if [ $x -eq 1 ]
then
echo "                            ----------------------------                        "
echo "                           |Por favor insira a interface|                       "
echo "                            ----------------------------                        "

iface=$(whiptail --title "Interface" --inputbox  "Digite a interface e M. Monitor: " --fb 10 60 3>&1 1>&2 2>&3)

airodump-ng -i $iface
fi

if [ $x -eq 2 ]
reset
logo
then
printf "\n"
echo -e $red " ============================================================================================================"
echo -e $red " Se estiveres a usar o COWPATTY quando pedir para entrar com o nome do arquivo escreva 'cowpatty' sem aspas  "
echo -e $red " ============================================================================================================"
printf "\n"
echo -e $yellow ""
printf "Desejas desactivar a placa \n que está em modo Monitor\n"
printf "\n \n"
read -p "$terminal y|n: " des

   if [ $des = "y" ];then
         printf "              Entre com a Interface\nque está em modo Monitor\n\n             "
         printf "\n"
         read -p "$terminal " des
         airmon-ng stop $des
    fi

echo -e $blue " "
echo "                            ----------------------------                        "
echo "                            |  Insira o MAC da REDE    |                        "
echo "                            ----------------------------                        "

mac=$(whiptail --title "Endereço MAC" --inputbox "Enter com o MAC da rede: " --fb 10 60 3>&1 1>&2 2>&3)
echo "$terminal $mac"
echo "                            ----------------------------                        "
echo "                            |    Insira o Canal        |                        "
echo "                            ----------------------------                        "
printf "\n"
read -p "$terminal " canal
printf "\n"
echo "                         -------------------------------------                   "
echo "                        |Por favor enter com o nome do arquivo|                  "
echo "                         -------------------------------------                   "
echo -e $red "exemplo: captura"
echo -e $red "qualquer nome que preferires, o arquivo será gravado no directorio onde a shell foi aberto"
printf "\n"
echo -e $red " ============================================================================================================"
echo -e $red " Se estiveres a usar o COWPATTY quando pedir para entrar com o nome do arquivo escreva 'cowpatty' sem aspas  "
echo -e $red " ============================================================================================================"
printf "\n"
printf "\n"
echo -e $blue" "
printf "\n"
read -p "$terminal " arquivo
printf "\n"
echo "                            -----------------------------                        "
echo "                           | Por favor insira a interface|                       "
echo "                            -----------------------------                        "
printf "\n"
iface2=$(whiptail --title "Interface" --inputbox "Digite a interface M. Monitor: " --fb 10 60 3>&1 1>&2 2>&3)

printf "\n"
echo -e $yellow "Carregando"
sleep 4

whiptail --title "Monitorar" --msgbox "A shell que abrirá em seguida é onde será executado o scripts desativar um cliente, digite na shell que abrirá #: bloquear" --fb 13 60
                                sleep 4
				gnome-terminal 
sleep 3

airodump-ng --bssid $mac --channel $canal --write $nome -i $iface2 --ignore-negative-one
else
echo "Paramentro Incorreto"
fi
