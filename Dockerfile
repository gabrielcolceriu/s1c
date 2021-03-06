ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

RUN apk add --no-cache jq \
py2-pip \
clang \
libgcc \
gcc-gnat \
libgc++ \
g++ \
make \
libffi-dev \
openssl-dev \
python2-dev \
mosquitto \
mosquitto-dev \
mosquitto-libs \
RUN pip install pyaes
RUN pip install broadlink
RUN pip install pycrypto
RUN pip install requests
RUN apk add --no-cache \
    	jq \
        py-pip \
	python \
	python-dev \
	python3 \
	mosquitto \
	mosquitto-clients \
	python3-dev\
 && pip install -U pip \
 && pip3 install -U pip \
 && pip install -U virtualenv

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
