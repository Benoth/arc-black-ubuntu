#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

DARK_SRC_FILE="assets.svg"
INDEX="assets.txt"

for i in `cat $INDEX`
do
	if [ -f $i.png ]; then
	    rm $i.png
	fi
	    echo Rendering $i.png
	    $INKSCAPE --export-id=$i \
	              --export-id-only \
	              --export-png=$i.png $DARK_SRC_FILE >/dev/null \
	    && $OPTIPNG -o7 --quiet $i.png
done
exit 0
