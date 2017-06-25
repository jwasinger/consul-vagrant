mkdir -p build/ssl && \
cd build/ssl && \
echo "000a" > serial && \
touch certindex && \
openssl req -x509 -newkey rsa:2048 -days 3650 -nodes -out ca.cert -subj '/O=Jared Wasinger/C=US/ST=Oregon/L=Portland/CN=consul' && \
openssl req -newkey rsa:1024 -nodes -out consul.csr -keyout consul.key -subj '/O=Jared Wasinger/C=US/ST=Oregon/L=Portland/CN=consul' && \
openssl ca -batch -config ../../conf/myca.conf -notext -in consul.csr -out consul.cert
