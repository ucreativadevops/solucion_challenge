# Desafio Clase 6 - CI/CD para Aplicacion Angular

Este repositorio contiene la informacion necesaria para configurar el ambiente para el desafio y los comandos para la interaccion con la aplicacion de Angular.

## Setup del Ambiente

### Jenkins

Dentro del repositorio existe un archivo llamado `Dockerfile`, este archivo contiene las instrucciones para construir una imagen de Docker con Jenkins - Angular - SonarScanner - Nginx instalados, para hacer el setup hay que seguir los siguientes pasos.

Dentro el directorio del repositorio ejecutar los siguientes comandos.
```sh
# Creamos el volumen de Docker con el comando docker volume create [nombre_volumen]
docker volume create jenkins_data

# Construimos la imagen de docker con el comando docker build -t [nombre_imagen]:[tag] [contexto]
docker build -t jenkins-ucreativa:v1 .

# Creamos la instancia de Jenkins con el comando docker run [nombre_image]:[tag]
docker run -d -p 8080:8080 -p 50000:50000 -p 8081:80 --restart=on-failure --mount "type=volume,src=jenkins_data,dst=/var/jenkins_home" --name jenkins-nginx jenkins-ucreativa:v1

# Accesamos a la instancia por el puerto 8080 en nuestro localhost

# Copiamos el token de acceso para Jenkins
docker logs jenkins-nginx
```

### SonarQube

SonarQube es una herramienta para analisis de vulnerabilidades en codigo, es ampliamente utilizado en el mercado y tiene un 'sabor' open source, vamos a utilizar esta herramienta para que nuestro Jenkins pueda ejecutar pruebas de analisis de codigo estatico en nuestra aplicacion Angular, vamos a ejecutar el siguiente comando.

```sh
# Creamos una instancia de SonarQube server de Docker utilizando el comando docker run [nombre_image]:[tag]
docker run -d -p 9000:9000 --restart=on-failure --name sonarqube-server sonarqube:lts-community

# Accesamos a la instancia por el puerto 9000 en nuestro localhost, deberemos de cambiar el password inicial se recomienda utilizar el admin123 para efectos de demostracion

# Finalmente vamos a proceder a extraer la IP del host donde corre el contenedor de sonarqube para colocarla en nuestro sonar-project.properties con el comando ip a en linux o ipconfig en windows

# Linux / Mac
ip a

# Windows
ipconfig
```

### Servidor Web

La imagen proporcionada de Jenkins tiene instalado el servidor web "nginx", para poder inicializarlo ejecutar el siguiente comando

```sh
# Ejecutamos una instruccion hacia el contenedor con el comando docker exec [nombre_contenedor] [comando]
docker exec jenkins-nginx service nginx start

# Visualizamos un mensaje en pantalla que nos indica que se esta inicializando el servidor web 'Starting nginx: nginx', luego podemos acceder a la instancia por el puerto 8081 en nuestro localhost

# Procedemos a borrar el archivo template que tiene nginx con el comando exec [nombre_contenedor] [comando]
docker exec jenkins-nginx rm /var/www/html/index.nginx-debian.html

# Tendremos el servidor web listo para el deployment
```

## Comandos para la Aplicacion Angular

Adjunto encontrara la lista de comandos que se deben utilizar para interactuar con la aplicacion Angular.

| Comando             | Descripcion                                   |
| ------------------- |-----------------------------------------------|
| npm install         | Instala las dependencias de la Aplicacion     |
| npm run lint        | Ejecuta las pruebas Lint del codigo           |
| npm run test        | Ejecuta las pruebas unitarias del codigo      |
| npm run sonar       | Ejecuta las pruebas para sonarqube            |
| npm run build       | Compila el proyecto y genera la carpeta dist  |

## Deployment

Para el deployment de la aplicacion, se debe de copiar los archivos generados en la carpeta **dist** hacia el directorio donde Nginx contiene los archivos raiz del servidor web, el cual es **/var/www/html/**

## Demostracion

Si todo el proceso se realiza de manera exitosa podremos visualizar nuestra version de Aplicacion de Angular en nuestro localhost por el puerto 8081
