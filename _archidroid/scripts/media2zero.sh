#!/tmp/bash
# Archi's Media2Zero
# JustArchi@JustArchi.net
if [ ! -d /data/media/0 ]; then
	mkdir -p /data/media/0
fi
cd /data/media
FILES=(*)
for i in *; do
	if [ "$i" != "0" ] && [ "$i" != "legacy" ] && [ "$i" != "obb" ]; then
		mv "$i" 0/
	fi
done

