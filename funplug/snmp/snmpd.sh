#!/ffp/bin/sh
#
# SNMP agent startup script
#
# Installation instructions are available at
# http://bernaerts.dyndns.org/nas/313-dns325-ffp7-supervise-snmp-agent
#
# History :
#  25/06/2014, V1.0 - Creation by N. Bernaerts

# PROVIDE: snmpd
# REQUIRE: LOGIN


conf_file=/ffp/etc/snmpd.conf
pid_file=/ffp/var/run/snmpd.pid

snmpd_flags="-A -p $pid_file -a -c $conf_file"

snmpd_start()
{
  if [ ! -r "$conf_file" ]; then
    echo "Error: Missing config file $conf_file"
    exit 1
  fi

  echo "Starting /ffp/sbin/snmpd $snmpd_flags"
  /ffp/sbin/snmpd $snmpd_flags
}

snmpd_stop()
{
  if [ -r "$pid_file" ]; then
    kill $(cat $pid_file) 2>/dev/null
  fi
}

snmpd_status()
{
  if [ -r $pid_file ]; then
    snmpd_pid=$(cat $pid_file)
    if pidof snmpd | grep -wq $snmpd_pid; then
      echo "snmpd running: $snmpd_pid"
    else
      echo "snmpd not running ($pid_file stale)"
    fi
  else
    echo "snmpd not running"
  fi
}

case "$1" in
start)
  snmpd_start
  ;;
stop)
  snmpd_stop
  ;;
restart)
  snmpd_stop
  sleep 1
  snmpd_start
  ;;
status)
  snmpd_status
  ;;
*)
  echo "Usage: $(basename $0) start|stop|restart|status"
  exit 1
  ;;
esac
