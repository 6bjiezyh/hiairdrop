#!/bin/sh

cnf_dir='/mnt/openssl/'
certs_dir='/etc/ssl/certs/'
openssl req -config ${cnf_dir}hiAirDropCA.cnf -new -x509 -days 1 -keyout ${certs_dir}hiAirDropCA.key -out ${certs_dir}hiAirDropCA.crt
openssl req -config ${cnf_dir}hiAirDropCert.cnf -new -out /tmp/hiAirDrop-dev.csr -keyout ${certs_dir}hiAirDrop-dev.key
openssl x509 -req -in /tmp/hiAirDrop-dev.csr -CA ${certs_dir}hiAirDropCA.crt -CAkey ${certs_dir}hiAirDropCA.key -CAcreateserial -extensions req_ext -extfile ${cnf_dir}hiAirDropCert.cnf -sha512 -days 1 -out ${certs_dir}hiAirDrop-dev.crt

exec "$@"