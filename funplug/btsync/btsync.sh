#!/ffp/bin/sh
#
# BTSync startup script
#
# History :
#  08/09/2014, V1.0 - Creation by N. Bernaerts

# PROVIDE: btsync
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="btsync"
start_cmd="btsync_start"
stop_cmd="btsync_stop"
restart_cmd="btsync_restart"

# set environment
BTSYNC_CMD="/ffp/home/btsync/btsync"
BTSYNC_PID="/ffp/home/btsync/btsync.pid"
BTSYNC_CONF="/ffp/home/btsync/btsync.conf"
BTSYNC_USER="nobody"

btsync_start()
{
  # start btsync with default configuration under user nobody
  su -c "$BTSYNC_CMD --config $BTSYNC_CONF" $BTSYNC_USER
}

btsync_stop()
{
  # kill running instance from PID
  kill $(cat $BTSYNC_PID)

  # delete PID file
  rm $BTSYNC_PID
}

btsync_restart()
{
  # kill running instance from PID
  kill $(cat $BTSYNC_PID)

  # delete PID file
  rm $BTSYNC_PID

  # start btsync with default configuration under user nobody
  su -c "$BTSYNC_CMD --config $BTSYNC_CONF" $BTSYNC_USER
}

# run the command given as parameter
run_rc_command "$1"
