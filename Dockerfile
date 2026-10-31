#Construcción de la imagen Docker
FROM nginx:alpine
RUN apk upgrade --no-cache

LABEL maintainer="Equipo DevOps - Duoc UC"
LABEL description="Microservicio web estático contenerizado para entorno cloud"

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]