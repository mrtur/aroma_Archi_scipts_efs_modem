#!/tmp/bash
if [ -e /data/media/0/ArchiDroid/Backups/efs.tar.gz ]; then
mount /dev/block/mmcblk0p3 /efs
busybox tar -zxvf /data/media/0/ArchiDroid/Backups/efs.tar.gz -C /
umount /efs
DATE1=`date`
echo "efs restore $DATE1" >>  /data/media/0/ArchiDroid/Backups/efs.txt
fi
exit 0
