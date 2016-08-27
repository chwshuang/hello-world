#!/bin/bash
#
# hushuang.me
# /etc/rc.d/init.d/tomcat
# init script for tomcat precesses
#
# processname: tomcat
# description: tomcat is a j2se server
# chkconfig: 2345 86 16
# description: Start up the Tomcat servlet engine.
# you mast change tomcat_home to you server path
CATALINA_HOME="/usr/local/{tomcat_home}"

if [ -f /etc/init.d/functions ]; then
    . /etc/init.d/functions
elif [ -f /etc/rc.d/init.d/functions ]; then
    . /etc/rc.d/init.d/functions
else
    echo -e "/atomcat: unable to locate functions lib. Cannot continue."
    exit -1
fi

RETVAL=$?

case "$1" in
    start)
        if [ -f $CATALINA_HOME/bin/startup.sh ];
        then
            echo $"Starting Tomcat"
            $CATALINA_HOME/bin/startup.sh
        fi
        ;;
    stop)
        if [ -f $CATALINA_HOME/bin/shutdown.sh ];
            then
            echo $"Stopping Tomcat"
            $CATALINA_HOME/bin/shutdown.sh
        fi
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

exit $RETVAL

