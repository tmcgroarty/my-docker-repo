FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY buildinfo.txt /buildinfo.txt 




EXPOSE 80
