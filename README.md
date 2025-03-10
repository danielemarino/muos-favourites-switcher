# muos-favourites-switcher
Favourites Lists switcher for use with MuOS (tested on ANBERNIC consoles)

The script must be placed (in serveral copies) in /mnt/mmc/MUOS/task and can be accessed via the App 'Task Toolkit'

Each script performs these operations:
1. it makes a backup of current favourites in their own folder
2. it copies the favourites from a given folder to the system favourites folder

Requisites:
1. user must create the folder /mnt/sdcard/MUOS/info/favourite.lists
2. into /mnt/sdcard/MUOS/info/favourite.lists user must create a folder for each favourites list that shall be used
3. into /mnt/mmc/MUOS/task there must be a copy of the script for each folder in /mnt/sdcard/MUOS/info/favourite.lists
