#!/bin/sh
# HELP: Manage Favourites
# ICON: sdcard
# Release 0.9

. /opt/muos/script/var/func.sh

pkill -STOP muxtask

# the example script is about a /mnt/sdcard/MUOS/info/favourite.lists/my_list_01 folder.
# name yours the way you want.
# my folder is named "folder" because I'm so unpredictable.
DIR_FROM="my_list_01"

MY_FAV_DIR="/mnt/sdcard/MUOS/info/favourite"
MY_SRC_DIR="/mnt/sdcard/MUOS/info/favourite.lists/$DIR_FROM"
MY_FAV_FILE="$MY_FAV_DIR/.favourites"

echo ""
echo ""
echo "==="
echo "=== RESTORING '$(echo "$DIR_FROM" | tr '[:lower:]' '[:upper:]')' FAVOURITES ==="
echo "==="
echo ""

if [ ! -f "$MY_FAV_FILE" ]; then
  echo "File .favourites non trovato!"
  pkill -CONT muxtask
  exit 1
fi

DIR_TO=$(cat "$MY_FAV_FILE")

if [ -z "$DIR_TO" ]; then
  echo "La variabile DIR è vuota!"
  pkill -CONT muxtask
  exit 1
fi

MY_DEST_DIR="/mnt/sdcard/MUOS/info/favourite.lists/$DIR_TO"

mkdir -p "$MY_DEST_DIR"

rm -rf "${MY_DEST_DIR:?}"/*.cfg
echo "Deleting files in '$DIR_TO'... done."
echo ""

cp -r "${MY_FAV_DIR:?}/"*.cfg "$MY_DEST_DIR/"
echo "Storing favourite files to '$DIR_TO'... done."
echo ""

rm -rf "${MY_FAV_DIR:?}"/*.cfg
echo "Deleting files in 'favourite'... done."
echo ""

cp -r "${MY_SRC_DIR:?}/"* "$MY_FAV_DIR/"
echo "Copying favourites from '$DIR_FROM' to 'favourite'... done."
echo ""

echo $DIR_FROM > $MY_FAV_FILE
echo "Creating index file in 'favourite'... done."
echo ""

echo "Syncing filesystem... done."
echo ""
sync

echo "All done. Exiting process..."
echo ""
sleep 3

pkill -CONT muxtask
exit 0
