#!/system/bin/sh

if [ ! -d "/data/tp" ]; then
    mkdir /data/tp
    chmod 0775 /data/tp
    chown system:system /data/tp
else
    rm /data/tp/*
fi

# synaptics_dsx
while [ ! -d "/sys/devices/soc/c179000.i2c/i2c-5/5-0020/input/input1" ]; do
    sleep 0.1
done

for input in /sys/devices/soc/c179000.i2c/i2c-5/5-0020/input/input*; do
    chown system:system $input/wake_gesture
    chmod 666 $input/wake_gesture
    ln -s $input/wake_gesture /data/tp/wake_gesture
done
