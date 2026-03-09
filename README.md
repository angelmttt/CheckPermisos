# CheckPermisos

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

