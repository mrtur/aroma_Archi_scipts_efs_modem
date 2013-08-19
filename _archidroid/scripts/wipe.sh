#!/tmp/bash
# Archi's Wipe
# clear /data exclude /data/media
# JustArchi@JustArchi.net
cd /data
FILES=(*)
for i in *; do
if [ "$i" != "media" ]
then rm -fR "$i"
fi
done

