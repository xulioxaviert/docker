# Imagen de Python
FROM python:3.9

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos de la aplicación
COPY . .

# Instalar las dependencias
RUN pip install -r requirements.txt

# Exponer el puerto
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]

# Instrucciones para construir y ejecutar la imagen
# 1. Construir la imagen:
#    docker build -t mi-python-image -f dockerfile .

# 2. Ejecutar el contenedor:
#    docker run -p 5000:5000 mi-python-image
#    (El contenedor mapeará el puerto 5000 del contenedor al puerto 5000 de la máquina host)

# 3. Para ejecutar en modo interactivo y eliminar el contenedor al salir:
#    docker run -it --rm mi-python-image
#    (Esto es útil para pruebas y desarrollo)

# 4. Ver los contenedores en ejecución:
#    docker ps

# 5. Ver todos los contenedores (incluidos los detenidos):
#    docker ps -a

# 6. Detener un contenedor:
#    docker stop <container_id>

# 7. Eliminar un contenedor:
#    docker rm <container_id>

# 8. Ver las imágenes disponibles:
#    docker images

# 9. Eliminar una imagen:
#    docker rmi <image_id>  

# 10 Con este comando levantamos el contenedor
#    docker run -p 5000:5000 mi-python-image

####################### Ejercicio 2 ##########################

FROM python:3.9

# Establecemos el directorio de trabajo
WORKDIR /app

# Instalamos las dependencias
COPY requirements.txt .
RUN pip install -r requirements.txt

# Variables de entorno
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=mysql
ENV MYSQL_HOST=root
ENV MYSQL_PASSWORD=password
ENV MYSQL_DB=my_db

# Exponemos el puerto
EXPOSE 5000
# Comando para ejecutar la aplicación
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

