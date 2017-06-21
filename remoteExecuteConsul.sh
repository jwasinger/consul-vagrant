consulServer="touch /vagrant/consul.log && consul agent -server -bootstrap-expect=1 -data-dir=/tmp/consul -node=agent-one -bind=172.20.20.11 -config-dir=/etc/consul.d >> /vagrant/consul.log"
consulClient="consul agent -data-dir=/tmp/consul -node=agent-two -bind=172.20.20.10 -config-dir=/etc/consul.d "
consuljoin="consul join 172.20.20.11"

if [ "$1" == "n1" ]
then
	echo "ssh ":$(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}'):" localhost 'cmd' "

	ssh $(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}') localhost "$consulServer &>/dev/null &"
	ssh $(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}') localhost "$consulJoin"
fi

if [ "$1" == "n2" ]
then
	ssh $(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}') localhost "$consulClient"
	ssh $(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}') localhost "$consulJoin"
fi

if [ "$1" == "n3" ]
then
	ssh $(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}') localhost "$consulClient"
	ssh $(vagrant ssh-config $1 | sed '/^[[:space:]]*$/d' |  awk 'NR>1 {print " -o "$1"="$2}') localhost "$consulJoin"
fi
