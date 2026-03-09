#!/bin/bash

# Paleta de Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
cyanColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -e "\n${yellowColour}[+]${endColour} ${blueColour}¿Qué archivos tienen permisos globales en tu carpeta personal?${endColour}\n"

check_permision=$(find ~ -type f -perm 777 2>/dev/null)

if [ -z "$check_permision" ]; then

echo -e "${greenColour}[:)] PERFECTO. Lo tienes bien montado. No tienes ninguna fichero con permisos globales${endColour}\n"
else
  echo -e "${redColour}[:|] CUIDADO. Revisa un poco tus ficheros. Tienes algún fichero con permisos globales${endColour}"
  echo -e "$check_permision\n"

fi

echo -e "\n${yellowColour}[+]${endColour} ${blueColour}¿Tienes archivos que puedan escalar de permisos con el bit SUID?${endColour}\n"

consult_SUID=$(find / -type f -perm 4000 2>/dev/null)

if [ -z "$consult_SUID" ]; then
  
  echo -e "${greenColour}[:)] PERFETO. No se han encontrado binarios SUID extraños${endColour}"
else
  echo -e "${redColour}[:|] CUIDADO. Se han encontrado binarios SUID que puede generear problemas${endColour}"
  echo -e "\n$consult_SUID\n"
  

fi

echo -e "\n${yellowColour}[+]${endColour} ${blueColour}¿Como tienes configurado los permisos cuando creas un archivo (umask)?${endColour}\n"

tipo_umask=$(umask)

if [ "$tipo_umask" == "0022" ]; then

  echo -e "${greenColour}[:)] Tu umask es $current_umask (PERFECTO). Los archivos nuevos están bien configurados ficheros (rw-rw-r--) y directorios (rwxr-xr-x).\n${endColour}"

else
  echo -e "${redColour}[:|] Tu umask es $current_umask (CUIDADO). Otros podrían modificar los archivos ficheros (rw-rw-r--) y directorios (rw-rw-r--)\n${endColour}"


echo -ne "${cyanColour}[?] ¿Quieres cambiar la umask a 0022 para mayor seguridad? (s/n): ${endColour}"
    read choice
    
    if [ "$choice" == "s" ]; then
        umask 022
        echo -e "\n${greenColour}[:)] umask cambiado correctamente a $(umask)\n${endColour}"
    else
        echo -e "\n${yellowColour}[:|] No se han realizado cambios. Pero ten cuidado\n${endColour}"
    fi


fi
