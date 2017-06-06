## if the node name is different change promotion@ with the one your node name is named..
for i in `ps -ef | grep promotion@ | awk '{print $2}'`; do echo $i; kill -9 $i; done

