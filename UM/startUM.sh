#!/bin/bash
# Start Universal Messaging
$UM_HOME/bin/nserver &

# Tail logs to keep the container running
tail -f $UM_HOME/server/default/logs/nirvana.log

