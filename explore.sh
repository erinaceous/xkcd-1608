#!/bin/bash
# Download the tiles from Randall!
# His server loves serving 404's at the speed of light, so this shotgun
# approach of trying tile numbers shouldn't matter too much. The majority
# of URLs we try will result in 404.
# To speed stuff up, we run wget in parallel. If this kills your internet,
# turn the PARALLEL value down.

PARALLEL=24
XMIN=928
XMAX=1107
YMIN=1069
YMAX=1112

for x in `seq $XMIN $XMAX`; do
    for y in `seq $YMIN $YMAX`; do
        echo "http://xkcd.com/1608/${x}:-${y}+s.png"
    done
done | xargs -P $PARALLEL wget -nc -nv

