FROM ntno/ubuntu-build-base:1.1.0

WORKDIR /usr/src/

COPY . .

RUN pip install -r /usr/src/requirements.txt

EXPOSE 8080

CMD ["mkdocs", "serve", "-v", "--dev-addr=0.0.0.0:8080"]
