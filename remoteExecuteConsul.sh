consulServer="consul agent -server -bootstrap-expect=1 -data-dir=/tmp/consul -node=agent-one -bind=172.20.20.10 -config-dir=/etc/consul.d"
if [ "$1" == "n1" ]
then
	ssh $(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}') localhost '$consulServer'
fi
