# Kriosoft POC

En este repositorio se encuentra el proyecto solicitado como parte del proceso de entrevista laboral.

# Requisitos

Este proyecto fue realizado en ASP.NET MVC, framework 4.7 y algunos paquetes NuGet, se recomienda hacer una recuperación de los mismos al descargar el proyecto.

Asi mismo, se incluyen scripts para la creación de la base de datos en diferentes motores SQL para su conveniencia y un backup integro que puede ser recuperado en SQL Server 2019. El nombre de la base de datos es "EjercicioKriosoft"

Cuando se cree/recupere la base de datos se deberá generar un login con la siguiente información:
Usuario:testkriosoft
Password:kriosoft1020
De preferencia ese usuario tendrá que estar mapeado a la base de datos creada

# Acceso al sistema

Se generó la estructura básica de login del framework ASP.NET, será necesario registrar un nuevo usuario para poder acceder al sistema, en caso de que se haya recuperado la base de datos con el backup y se desee usar las credenciales que usé para desarrollo son las siguientes:

Usuario: besthie@hotmail.com
Password: Kriosoft1020!

# Descripción general del sistema

Se entrega el sistema conforme lo solicitado, es un proyecto web en MVC que contempla el CRUD de alumnos y grupos de alumnos, la base de datos está ordenada de la siguiente manera:

![kriosoftDB](https://user-images.githubusercontent.com/101443596/158026353-c0a5696e-d0d5-493b-b702-26c29c7c5350.png)


La idea general es la siguiente:
-Se generó el CRUD para los alumnos, la edad se calcula en automático con la fecha de nacimiento.
-Se generó la asignación de profesores a grupos previamente creados y con cantidades de alumnos establecidas.

Se omitió lo siguiente:
-CRUD para profesores y grupos.
-CRUD para asignación de alumnos a grupos.

Sin embargo, la estructura de la base de datos permitiría hacer dichas inclusiones.

# Video del sistema

Se encuentra un video en internet del funcionamient del sistema en youtube:

https://youtu.be/FLfDwxSMwzQ
