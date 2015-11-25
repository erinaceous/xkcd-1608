#!/bin/bash
# Once you've got the tiles, map 'em!
# Owain Jones [github.com/erinaceous]
# 
# TILESIZE is the pixel width/height of an individual tile. Turn it up
# to get a bigger image.

TILESIZE=128  # Default, overridden by command line argument

if [ "$1" != "" ]; then
    TILESIZE=$1
fi

# Generate a blank tile
convert -size 513x513 xc:white blank.png

mkdir $TILESIZE
cd $TILESIZE

# Discovered from downloading all the images
YMIN=1069
YMAX=1112
XMIN=928
XMAX=1107

for y in `seq -$YMAX -$YMIN`; do
    y=`echo $y | cut -d '-' -f 2`
    row=""
    for x in `seq $XMIN $XMAX`; do
        name="../${x}:-${y}+s.png"
        if [ -f $name ]; then
            row="$row $name"
        else
            row="$row ../blank.png"
        fi
    done

    # Build up the image one row at a time
    cmd="montage $row -tile x1 -geometry ${TILESIZE}x${TILESIZE}+0+0 row_${y}.png"
    echo $cmd
    $cmd
done

# Now combine the rows
ROWS=$(for y in `seq $YMIN $YMAX`; do echo "row_${y}.png"; done | sort -h -r)
cmd="montage $ROWS -tile 1x -geometry +0+0 map.png"
echo $cmd
$cmd
