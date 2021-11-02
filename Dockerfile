FROM ntno/ubuntu-build-base:0.0.9

WORKDIR /usr/src/

COPY . .

RUN pip install -r /usr/src/requirements.txt

WORKDIR /usr/src/

# RUN mkdocs build -t custommill
#RUN git clone https://github.com/Siphalor/mkdocs-custommill/

CMD [ "mkdocs", "serve", "-v", "--dirtyreload", "-a", "0.0.0.0:8080" ]
