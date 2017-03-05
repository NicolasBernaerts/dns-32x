#!/ffp/bin/sh

# PROVIDE: dashbutton-goodnight
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="dashbutton-goodnight"
command="/ffp/sbin/dashbutton"
start_cmd="dashbutton_start"

dashbutton_flags="--mac-address AC:63:BE:76:41:36 --net-interface egiga0 --action telegram-goodnight"

# start dash button detection script as a background process
dashbutton_start()
{
	proc_start_bg $command
}

run_rc_command "$1"
