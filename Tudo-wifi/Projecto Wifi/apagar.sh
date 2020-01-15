#! /bin/bash

if [ $USER = "root" ];
       then
          if [ -d /usr/bin/Interceptador ];then
                    rm -r /usr/bin/Interceptador
                  fi
          if [ -f /usr/bin/redewifi.sh ] || [ -f /usr/bin/tudowi-fi_install.sh ]
                  then
                     rm /usr/bin/tudowi-fi_install.sh 
                     rm /usr/bin/redewifi.sh
                     rm /usr/bin/apagar.sh

             ver=´cat /root/.bashrc | grep tudowifi´
              ver1=´cat /root/.bashrc | grep monitorar´
              ver2=´cat /root/.bashrc | grep bloquear´                

        whiptail --title "O resto" --msgbox "O resto das definições estão gravadas em: /root/.bash com os nomes $ver , $ver1, $ver2 " --fb 13 25
        sleep 6
        whiptail --title "Desistalação" --msgbox "Ficheiros removido com sucesso!" --fb 13 25

         fi
   else
           sudo su

       if [ -d /usr/bin/Interceptador ];then
                    rm -r /usr/bin/Interceptador
                  fi
          if [ -f /usr/bin/redewifi.sh ] || [ -f /usr/bin/tudowi-fi_install.sh ]
                  then
                     rm /usr/bin/tudowi-fi_install.sh 
                     rm /usr/bin/redewifi.sh
                     rm /usr/bin/apagar.sh

              dir="$HOME"

             ver=´cat $dir/.bashrc | grep tudowifi´
              ver1=´cat $dir/.bashrc | grep monitorar´
              ver2=´cat $dir/.bashrc | grep bloquear´                

        whiptail --title "O resto" --msgbox "O resto das definições estão gravadas em: $dir/.bash com os nomes $ver , $ver1, $ver2 " --fb 13 25
       sleep 6
        whiptail --title "Desistalação" --msgbox "Ficheiros removido com sucesso!" --fb 10 20

	fi
	fi
	
