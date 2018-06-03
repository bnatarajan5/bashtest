#!/bin/bash
#Author: Balasubramaniam Natarajan
#Date: 3Jun2018
#Description: This code will run ifconfig and show the IP an instant to read form
# as well as show the Established connections on a machine via netstat and
# show the used percentage of your home partition.

/sbin/ifconfig | /bin/grep -B 1 "inet addr:" | /bin/sed ':a;N;$!ba;s/\n//g' \
| /bin/sed "s/--/\n/g" | /bin/egrep -o "^\w+.*inet\saddr:\w+\.\w+\.\w+\.\w+" \
| /bin/sed "s/Link.*inet addr:/ interface has the IP = /g" | sed "s/  //g"

/bin/df -h | /bin/grep home | /usr/bin/awk '{print $5}' \
 | /bin/sed -e "s/^/Your Home partition is /" -e "s/$/ full/"

/bin/df -h | /bin/grep home | /usr/bin/awk '{print $5}' \
 | /bin/sed -e "s/^/Your Home partition is /" -e "s/$/ full/"
