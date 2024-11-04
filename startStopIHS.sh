#!/bin/bash
#-----------------------------------------------------------------------------------------
# Script Name:     startStopIHS.sh
# Description:     Script that starts/stops or restarts IBM HTTP Server (IHS)
# Author:          Martim Luís
# Date Created:    18/05/2024
# Version:         1.0
# 
# Usage:           Run this script in a shell terminal with appropriate privileges providing the action.
#                  Example: ./startStopIHS.sh start/stop/restart
# 
# Version History:
#   v1.0 - 18/03/2023: Initial release
#   <Add future version details as needed>
#
# Notes:
#   - Make sure the user used to execute this script contains privileges in IHS executables.
#   - You can schedule the script to run at a specific time via Crontab.
#   - You can automate the script by calling him via Ansible Playbook.
#   - This script has been tested on RHEL V9.1.
#   - Modify the parameters as needed to fit your environment.
#   - Backup any important data before running this script.
#
#----------------------------------------------------------------------------------------

#Action received when calling script
wascommand=$1
#Location of IHS Executables
ihsexecutablesadmin=/opt/IBM/HTTPServer/bin/adminctl
ihsexecutables=/opt/IBM/HTTPServer/bin/apachectl
#Location of IHS Config Files
ihsconfigfile=/opt/IBM/HTTPServer/conf/httpd_IHS_01.conf

if [ $wascommand = 'start' ];
      then
            $ihsexecutablesadmin start
            $ihsexecutables -k start -f $ihsconfigfile
      exit 0
elif [ $wascommand = 'stop' ];
       then
	      $ihsexecutablesadmin stop
            $ihsexecutables -k stop -f $ihsconfigfile
	  exit 0
elif [ $wascommand = 'restart' ];
      then
            $ihsexecutablesadmin restart
            $ihsexecutables -k restart -f $ihsconfigfile
	exit 0
else
        echo "No valid argument received! Valid arguments are start/stop/restart"
fi