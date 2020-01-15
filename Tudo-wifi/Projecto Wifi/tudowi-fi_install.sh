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
}

# função da instalacao
function instalacao {

  apt-get update; apt full-update
     apt-get upgrade
    sleep 5
#com o whiptail pergunta se deseja proceguir com a instalação
 whiptail --title "Instalação" --yesno "Deseja continuar com a Instalação?" --fb 10 40
        if [ $? -eq 0 ];then

          if [ -f /usr/bin/aircrack-ng ];then 
		  echo -e $yellow "O aircrack ja está instalado"
                   else
                      apt-get install aircrack-ng
                   fi
          if [ -f /usr/bin/crunch ];then 
		  echo -e $yellow "O crunch ja está instalado"
                   else
                      apt-get install crunch
		      apt install wordlists
                   fi
          if [ -f /usr/bin/wifite ];then 
		  echo -e $yellow "O wifite ja está instalado"
                   else
                      apt-get install wifite
                   fi
          if [ -f /usr/bin/john ];then 
		  echo -e $yellow "O john Riper ja está instalado"
                   else
                      apt-get install john ; apt-get install jhonny
                   fi
          if [ -f /usr/bin/reaver ];then 
		  echo -e $yellow "O Reaver ja está instalado"
                   else
                      apt-get install reaver; apt-get install cowpatty
                   fi
		   if [ -n /usr/bin/whiptail ]
			   then
				   apt-get install whiptail
				   
fi

 whiptail --title "Instalação dos Pacotes necessario" --msgbox "Instação dos pacotes Concluida. Obrigado" --fb 10 40
 fi

 usuario="$USER"
if [ -f /usr/bin/redewifi.sh ]
	then
           printf "\n"
           echo -e $red "Desculpe mas o arquivo ja exite no directorio /usr/bin/redewifi"
           printf "\n"
           sleep 7
        else
		if [ $usuario = "root" ];then
                     #cp redewifi.sh /usr/bin/
                     cp redewifi.sh /usr/bin
                     cp -r Interceptador/ /usr/bin
                     chmod 775 /usr/bin/redewifi.sh
                     chmod 775 /usr/bin/Interceptador/monitorar.sh
                     chmod 775 /usr/bin/Interceptador/bloquear.sh
                     chmod 775 /usr/bin/apagar.sh
                     colar="/usr/bin/redewifi.sh"
                     colarm="/usr/bin/Interceptador/monitorar.sh"
                     colarb="/usr/bin/Interceptador/bloquear.sh"
                     colaa="/usr/bin/apagar.sh"
                     echo "alias apagarwifi='$colaa'" >> /home/$usuario/.bashrc
		     echo "alias tudowifi='$colar'" >> /root/.bashrc
                     echo "alias monitorar='$colarm'" >> /root/.bashrc
                     echo "alias bloquear='$colarb'" >> /root/.bashrc


	     else
		     #cp redewifi.sh /usr/bin/
                     cp redewifi.sh /usr/bin
                     cp apagar.sh /usr/bin
		     cp -r Interceptador/ /usr/bin
                     colar="/usr/bin/redewifi.sh"
                     colaa="/usr/bin/apagar.sh"
                     colarm="/usr/bin/Interceptador/minitorar.sh"
                     colarb="/usr/bin/Interceptador/bloquear.sh"
                     echo "alias apagarwifi='$colaa'" >> /home/$usuario/.bashrc
		     echo "alias tudowifi='$colar'" >> /home/$usuario/.bashrc
                     echo "alias monitorar='$colarm'" >> /home/$usuario/.bashrc
                     echo "alias bloquear='$colarb'" >> /home/$usuario/.bashrc
		     chmod +x /usr/bin/redewifi.sh
                     chmod +x /usr/bin/apagar.sh
                     chmod +x /usr/bin/Interceptador/monitorar.sh
                     chmod +x /usr/bin/Interceptador/bloquear.sh
                     
	     fi
	     echo -e $cyan "finalizado."
	     echo -e $blue "                 para usar o scrip" 
	     echo -e $blue "             na shell digite# |tudowifi| "
	     whiptail --title "finalizando" --msgbox "para uasar o scrip digite no terminal# => tudowifi " --fb 15 55
	 fi

}
 #començando a instalacao
raiz="$USER"
root=`sudo su`

logo
if [ "$raiz" = "root" ]
then
        instalacao   

else
sudo apt-get update
sudo apt full-update
sudo apt-get upgrade
sudo su

       instalacao
fi

        if [ -x ~/redewifi.sh ]
		  then
                       clear
			  echo -e $yellow "aguarde..."
			  sleep 3
			  ./redewifi.sh
		  else
			  chmod +x redewifi.sh
			  echo -e $yellow "aguarde..."
			  sleep 3
			  clear 
                         ./redewifi.sh
			  fi

