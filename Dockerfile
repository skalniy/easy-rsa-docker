FROM alpine

RUN apk add --no-cache easy-rsa

COPY ./vars /usr/share/easy-rsa/vars

WORKDIR /var/lib/easy-rsa

VOLUME /var/lib/easy-rsa

ENTRYPOINT ["/usr/share/easy-rsa/easyrsa"]

CMD ["help"]
