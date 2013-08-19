#!/tmp/bash
# Archi's Wipe Media
# wipes /data/media
# JustArchi@JustArchi.net
cd /data/media
FILES=(*)
for i in *; do
rm -fR "$i"
done

