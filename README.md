# CheckPermisos

An interactive Bash script designed for quick security auditing of Linux system permissions.

## Description
This tool identifies insecure permission configurations that could be exploited for unauthorized access or privilege escalation in a Linux environment. It focuses on critical areas such as global write permissions and SUID binaries.

## Features
* Home Directory Audit: Scans for files with global permissions (777).
* Privilege Escalation Detection: Detects binaries with the SUID bit active.
* User Security Configuration: Verifies if the umask value is secure and allows for modification.
* Visual Interface: Results are categorized by colors to facilitate quick identification of risks.

## Requirements
* Linux-based operating system (Tested on Parrot OS and Debian).
* Bash command interpreter.

## Installation and Usage
1. Clone the repository to your local machine.
2. Grant execution permissions to the script:
   ```bash
   chmod +x check_perm.sh
   ```
3. Run the tool:
   ```bash
   ./check_perm.sh
   ```
---


## Spanish Version

Script interactivo en Bash para realizar una auditoria rapida de seguridad sobre los permisos del sistema Linux.

## Descripcion
Esta herramienta permite identificar configuraciones de permisos inseguras que podrian ser aprovechadas para el acceso no autorizado o la escalada de privilegios en un entorno Linux.

## Funcionalidades
* Auditoria de Home: Busca archivos con permisos globales (777).
* Escalada de Privilegios: Detecta binarios con el bit SUID activo en el sistema.
* Seguridad de Usuario: Verifica si el valor de umask es seguro y permite su modificacion.
* Interfaz Visual: Resultados categorizados por colores para facilitar la lectura.

## Requisitos
* Sistema operativo basado en Linux (Probado en Parrot OS y Debian).
* Interprete de comandos Bash.

## Instalacion y Uso
1. Clona el repositorio en tu maquina local.
2. Otorga permisos de ejecucion al script:
   ```bash
   chmod +x check_perm.sh
   ``` 
3. Ejecuta la herramienta:
   ```bash
   ./check_perm.sh
   ```

