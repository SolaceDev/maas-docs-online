FROM k8s.gcr.io/nginx-slim:0.8
EXPOSE 80
COPY docs/_build/html /usr/share/nginx/html
