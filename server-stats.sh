#!/bin/bash
echo -e "\nTotal CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100-$8"%"}'
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}'
df -h --total | grep "total" | awk '{printf "Disk Usage: %s/%s (%s used)\n", $3, $2, $5}'
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6
