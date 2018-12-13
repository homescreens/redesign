#!/bin/bash
# Resizes images
# Requires imagemagick
# Based off https://github.com/mavieth/image-resizer

SIZE="500kb"
SCALE="20%"

for image in `ls -r *.{png,jpeg,jpg,JPG} -R 2>/dev/null`; do

	# Save original copy in full directory
	cp $image full/$image

	# Convert
	convert $image -define jpeg:extent=$SIZE -scale $SCALE -auto-orient $image

	# Move converted image to thumbnail directory
	mv $image thumb/

	# Display message
	echo "<div class="item">"
	echo "<a href=\"./full/$image\"><img src=\"./thumb/$image\" alt=\"FILLTHISIN\"></a>"
	echo "</div>"

done
