#!/tmp/bash
if [ -e /data/media/0/ArchiDroid/Backups/efs_OLD.tar.gz ]; then
mount /dev/block/mmcblk0p3 /efs
busybox tar -zxvf /data/media/0/ArchiDroid/Backups/efs_OLD.tar.gz -C /
umount /efs
DATE1=`date`
echo "efs_OLD restore $DATE1" >>  /data/media/0/ArchiDroid/Backups/efs.txt
fi
exit 0
