#!/ffp/bin/sh
#
# Munin node startup script
#
# Installation instructions are available at
# http://
#
# History :
# 26/06/2014, V1.0 - Creation by N. Bernaerts

# PROVIDE: munin-node
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="munin-node"
start_cmd="node_start"
stop_cmd="node_stop"
restart_cmd="node_restart"

pid_file="/ffp/var/run/munin/munin-node.pid"
required_files="/ffp/etc/munin/munin-node.conf"

node_start()
{
  # start munin-node
  /ffp/bin/perl -T /ffp/sbin/$name
}

node_stop()
{
  # kill running instance from PID
  kill `cat "$pid_file"`
}

node_restart()
{
  # kill running instance from PID
  kill `cat $pid_file`

  # start munin-node
  /ffp/bin/perl -T /ffp/sbin/$name
}

# run the command given as parameter
run_rc_command "$1"
