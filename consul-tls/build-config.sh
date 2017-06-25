mkdir -p build/server/consul.d/ssl/CA && mkdir -p build/client/consul.d/ssl && \

cp build/ssl/ca.cert build/server/consul.d/ssl && \
cp build/ssl/consul.key build/server/consul.d/ssl && \
cp build/ssl/consul.cert build/server/consul.d/ssl && \

#chmod 0700 server/consul.d/ssl/CA && \
echo "building CA server config"
cp -R build/ssl/* build/server/consul.d/ssl/CA && \
cp -R conf/server-config.json build/server/consul.d/config.json && \

echo "building client config"
cp build/ssl/ca.cert build/client/consul.d/ssl && \
cp build/ssl/consul.key build/client/consul.d/ssl && \
cp build/ssl/consul.cert build/client/consul.d/ssl && \

cp conf/client-config.json build/client/consul.d

cp $GOPATH/src/github.com/hashicorp/consul/bin/consul build/client && \
cp $GOPATH/src/github.com/hashicorp/consul/bin/consul build/server
