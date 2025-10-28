#!/bin/bash

repertoire="/mnt/backup-raspberry"

if tail -n 3 /var/log/rsync.log | grep -qi "error"; then
        echo 1


else
        echo 0


fi
