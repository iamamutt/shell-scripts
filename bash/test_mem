#! /bin/sh

# tmux new -s stats
LOG_FILE="/home/ubuntu/vmstats_$(date +'%Y-%m-%d_%H').log"
echo "Stats log: $(date)" >$LOG_FILE
uname -a >>$LOG_FILE
lscpu >>$LOG_FILE
lsblk >>$LOG_FILE
nohup vmstat -wantS m 4 7200 >>$LOG_FILE &
