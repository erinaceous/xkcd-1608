xkcd-1608
=========

Uses sh, wget and imagemagick to build a map of 1608

* `explore.sh`: Run this to download all the image tiles from xkcd server to the
current directory. They're about 7MB in total.

* `cartography.sh [tile_size]`: Run this with optional tile\_size command to
generate the map. Bigger tiles mean more memory used. To generate a full size
image, the tilesize should be 513. Puts the resulting map.png in a subfolder
named by the tilesize.
