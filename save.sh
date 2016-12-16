#!/bin/bash

# load the list of items to track
source track_list.source

# load the configs
source settings.conf

# making save folder if doesn't already exists
mkdir -p "$SAVE_FOLDER"

# get home folder
home_folder="$HOME"

# loop on items to sync
while read item ; do
	echo "syncing $item"
	rsync -v -d --no-owner "$home_folder/$item" "$SAVE_FOLDER"
	if [ $? -ne 0 ];then
		echo "Sync of $item failed";
		exit 1;
	fi
done < <(echo "$tracked_items")


