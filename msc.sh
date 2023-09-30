echo /dev/block/mmcblk1 > /sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file
echo "echo 0 > /sys/devices/virtual/android_usb/android0/enable && echo \"mass_storage,adb\" > /sys/devices/virtual/android_usb/android0/functions && echo 1 > /sys/devices/virtual/android_usb/android0/enable" > enable_mass.sh
sh enable_mass.sh
