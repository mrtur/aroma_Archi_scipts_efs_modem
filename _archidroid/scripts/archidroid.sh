#!/tmp/bash

# Force EFS Backup
if [ ! -d /data/media/0/ArchiDroid/Backups ]; then
	mkdir -p /data/media/0/ArchiDroid/Backups
fi

if [ -e /data/media/0/ArchiDroid/Backups/efs_OLD.tar.gz ]; then
	rm -f /data/media/0/ArchiDroid/Backups/efs_OLD.tar.gz
fi
if [ -e /data/media/0/ArchiDroid/Backups/efs.tar.gz ]; then
	mv /data/media/0/ArchiDroid/Backups/efs.tar.gz /data/media/0/ArchiDroid/Backups/efs_OLD.tar.gz
fi
mount /dev/block/mmcblk0p3 /efs
busybox tar zcvf /data/media/0/ArchiDroid/Backups/efs.tar.gz /efs
umount /efs

DATE1=`stat /data/media/0/ArchiDroid/Backups/efs.tar.gz | tail -n 2 | head -n 1`
echo "efs.tar.gz $DATE1" >  /data/media/0/ArchiDroid/Backups/efs.txt
if [ -e /data/media/0/ArchiDroid/Backups/efs_OLD.tar.gz ]; then
	DATE2=`stat /data/media/0/ArchiDroid/Backups/efs_OLD.tar.gz | tail -n 2 | head -n 1`
	echo "efs_OLD.tar.gz $DATE2" >>  /data/media/0/ArchiDroid/Backups/efs.txt
fi
echo "
ArchiDroid performed a backup of your /efs partition just in case. Here you can find two most recent backups with dates above.
Backups are stored in compressed tar (gzip) format. They include directory structure so should be extracted to the root / of the filesystem instead of /efs.
Permissions of the files are stored as well so you don't need to fix them manualy.

If you need to restore such backup firstly make sure your /efs is mounted as read/write. Should be on normal boot up.
Then you can use terminal command, such as:
busybox tar -zxvf /data/media/0/ArchiDroid/Backups/efs.tar.gz -C /
Running from root of course.

If you have no idea how to use above command extract .tar archive from .tar.gz backup (7-zip works fine) and use any third-party app, f.e. efs professional or anything else able to restore from .tar format (nearly everything I guess).
And don't forget to hit thanks if this backup saved your ass ;)" >> /data/media/0/ArchiDroid/Backups/efs.txt

exit 0
