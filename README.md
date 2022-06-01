# Desafio Clase 6 - CI/CD para Aplicacion Angular

Este repositorio contiene la informacion necesaria para configurar el ambiente para el desafio y los comandos para la interaccion con la aplicacion de Angular.

## Jenkins

Dentro del repositorio existe un archivo llamado `Dockerfile`, este archivo contiene las instrucciones para construir una imagen de Docker con Jenkins - Angular - SonarScanner - Nginx instalados, para hacer el setup hay que seguir los siguientes pasos.

Dentro el directorio del repositorio ejecutar los siguientes comandos.
```sh
# Creamos el volumen de Docker con el comando docker volume create [nombre_volumen]
docker volume create jenkins_data

# Construimos la imagen de docker con el comando docker build -t [nombre_imagen]:[tag] [contexto]
docker build -t jenkins-ucreativa:v1 .

# Creamos la instancia de Jenkins con el comando docker run [nombre_image]:[tag]
docker run -d -p 8080:8080 -p 50000:50000 -p 8081:80 --restart=on-failure --mount "type=volume,src=jenkins_data,dst=/var/jenkins_home" jenkins-ucreativa:v1

# Accesamos a la instancia por el puerto 8080 en nuestro localhost
```

## SonarQube

SonarQube es una herramienta para analisis de vulnerabilidades en codigo, es ampliamente utilizado en el mercado y tiene un 'sabor' open source, vamos a utilizar esta herramienta para que nuestro Jenkins pueda ejecutar pruebas de analisis de codigo estatico en nuestra aplicacion Angular, vamos a ejecutar el siguiente comando.

```sh
# Creamos una instancia de SonarQube server de Docker utilizando el comando docker run
docker run -d -p 9000:9000 --restart=on-failure sonarqube:lts-community

# Accesamos a la instancia por el puerto 9000 en nuestro localhost, deberemos de cambiar el password inicial se recomienda utilizar el admin123 para efectos de demostracion
```

## Comandos para la Aplicacion Angular e Inicializar Servidor Web

Adjunto encontrara la lista de comandos que se deben utilizar para interactuar con la aplicacion Angular.

| Left columns        | Right columns                                 |
| ------------------- |-----------------------------------------------|
| npm install         | Instala las dependencias de la Aplicacion     |
| npm run lint        | Ejecuta las pruebas Lint del codigo           |
| npm run test        | Ejecuta las pruebas unitarias del codigo      |
| npm run sonar       | Ejecuta las pruebas para sonarqube            |
| npm run build       | Compila el proyecto y genera la carpeta dist  |
| service nginx start | Inicializa el servidor web en el puerto 80    |

## Deployment

Para el deployment de la aplicacion, se debe de copiar los archivos generados en la carpeta **dist** hacia el directorio donde Nginx contiene los archivos raiz del servidor web.

## Demostracion

Si todo el proceso se realiza de manera exitosa podremos visualizar nuestra version de Aplicacion de Angular en nuestro localhost por el puerto 8081