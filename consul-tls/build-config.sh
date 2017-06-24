mkdir -p server/consul.d/ssl/CA && mkdir -p client/consul.d/ssl && \


#chmod 0700 server/consul.d/ssl/CA && \
echo "building CA server config"
cp -R conf/ssl/* server/consul.d/ssl/CA && \
cp -R conf/config.json server/consul.d && \
cp conf/ssl/ca.cert server/consul.d/ssl && \
cp conf/ssl/consul.key server/consul.d/ssl && \
cp conf/ssl/consul.cert server/consul.d/ssl && \

echo "building client config"
cp conf/ssl/ca.cert client/consul.d/ssl && \
cp conf/ssl/consul.key client/consul.d/ssl && \
cp conf/ssl/consul.cert client/consul.d/ssl && \
cp conf/config.json client/consul.d

cp $GOPATH/src/github.com/hashicorp/consul/bin/consul server && \
cp $GOPATH/src/github.com/hashicorp/consul/bin/consul client
