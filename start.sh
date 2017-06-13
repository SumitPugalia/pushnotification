#!/bin/sh
##  Replace promotion@127.0.0.1 with promotion@ip-address (nodename)...
run_erl -daemon /tmp/pushnotification /tmp/log_dir/ "erl -pa ./ebin -pa ./lib/*/ebin -name promotion@127.0.0.1 -setcookie emq_dist_cookie"


