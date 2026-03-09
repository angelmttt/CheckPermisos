#!/bin/bash

# Color Palette
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
cyanColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -e "\n${yellowColour}[+]${endColour} ${blueColour}Which files have global permissions in your home folder?${endColour}\n"

check_permision=$(find ~ -type f -perm 777 2>/dev/null)

if [ -z "$check_permision" ]; then
    echo -e "${greenColour}[:)] PERFECT. Everything is well set up. You don't have any files with global permissions${endColour}\n"
else
    echo -e "${redColour}[:|] WARNING. Check your files. You have some files with global permissions${endColour}"
    echo -e "$check_permision\n"
fi

echo -e "\n${yellowColour}[+]${endColour} ${blueColour}Do you have files that can escalate permissions with the SUID bit?${endColour}\n"

consult_SUID=$(find / -type f -perm 4000 2>/dev/null)

if [ -z "$consult_SUID" ]; then
    echo -e "${greenColour}[:)] PERFECT. No strange SUID binaries were found${endColour}"
else
    echo -e "${redColour}[:|] WARNING. SUID binaries have been found that could cause problems${endColour}"
    echo -e "\n$consult_SUID\n"
fi

echo -e "\n${yellowColour}[+]${endColour} ${blueColour}How are your permissions configured when you create a file (umask)?${endColour}\n"

tipo_umask=$(umask)

if [ "$tipo_umask" == "0022" ]; then
    echo -e "${greenColour}[:)] Your umask is $current_umask (PERFECT). New files are well configured (rw-r--r--) and directories (rwxr-xr-x).\n${endColour}"
else
    echo -e "${redColour}[:|] Your umask is $current_umask (WARNING). Others might modify your files (rw-rw-r--) and directories (rw-rw-r--)\n${endColour}"

    echo -ne "${cyanColour}[?] Do you want to change the umask to 0022 for better security? (y/n): ${endColour}"
    read choice
    
    if [ "$choice" == "y" ]; then
        umask 022
        echo -e "\n${greenColour}[:)] umask successfully changed to $(umask)\n${endColour}"
    else
        echo -e "\n${yellowColour}[:|] No changes were made. But be careful\n${endColour}"
    fi
fi
