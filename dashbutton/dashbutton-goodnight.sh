#!/ffp/bin/sh

# PROVIDE: dashbutton-goodnight
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="dashbutton-goodnight"
command="/ffp/sbin/$name"
start_cmd="dashbutton_start"

dashbutton_goodnight_flags="192.168.1.80"

# start dash button detection script as a background process
dashbutton_start()
{
	proc_start_bg $command
}

run_rc_command "$1"
