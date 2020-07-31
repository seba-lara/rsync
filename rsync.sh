#!/bin/bash
local=$(ls /home/ntp/rsync)
#remote=$(ssh root@192.168.1.193 -i /root/.ssh/id_rsa ls /root/rsync)
remote=$(ssh root@192.168.1.193 "ls /root/rsync")

#if [ $local -gt $remote ];
#rsync -uaprv /home/ntp/rsync/* root@192.168.1.193:/root/rsync/
#  --log-file=/var/log/rsync.log
#elif [[ $local -lt $remote ]];
#else
#rsync -uaprv root@192.168.1.193:/root/rsync/* /home/ntp/rsync
# --log-file=/var/log/rsync.log
#fi
#exit 0

if [ "$remote" -gt "$local" ]; then
	rsync -uprv "root@192.168.1.193:/root/rsync/" "/home/ntp/rsync/"
else
	rsync -uprv "/home/ntp/rsync/" "root@192.168.1.193:/root/rsync/"
fi
