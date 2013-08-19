#!/tmp/bash
# Archi's Zero2Media
# JustArchi@JustArchi.net
if [ -d /data/media/0 ]; then
	cd /data/media/0
	FILES=(*)
	for i in *; do
		mv "$i" ../
	done
	cd ..
	rm -Rf 0/
fi
