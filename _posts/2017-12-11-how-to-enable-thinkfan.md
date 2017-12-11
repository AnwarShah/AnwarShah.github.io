---
layout: post
title: How to enable thinkfan on Lenovo Y410
categories: [linux, fan_control]
permalink: /2017/12/11/how-to-enable-thinkfan
---
You can control lenovo thinkpad's fan via thinkfan. Here is the procedure

#### A Warning!!
{: style="text-align: center;" }
Controlling may lead to more problem if not done carefully. Please thoroughly check
your fan configuration and levels. Also test it in no-deamon mode.

### Install thinkfan

    sudo apt install thinkfan

### Configure thinkfan

Open the file `/etc/thinkfan.conf` and add these details at the end

    hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_input
    hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_input
    hwmon /sys/devices/virtual/hwmon/hwmon0/temp1_input

    (0, 0,  18)
    (1, 20, 30)
    (2, 28, 38)
    (3, 36, 47)
    (4, 45, 56)
    (5, 55, 61)
    (7, 60, 32767)

Please note that, your monitoring sensor may be different. You can find which sensors you device has by this command

    find /sys/devices/ -type f -name "temp*_input"

This command may report something like this

    /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp2_input
    /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp3_input
    /sys/devices/virtual/hwmon/hwmon0/temp1_input

### Enable kernel autoload and options

Now enable autoloading of `thinkpad_acpi` kernel module by editing `/etc/modules` file and adding this line

    thinkpad_acpi

Now add options for this module by creating (or editing) a file at `/etc/modprobe.d/thinkpad_acpi.conf` (any filename with .conf extension will do the job)

    options thinkpad_acpi fan_control=1

Now save the file and restart.

Use `thinkfan -n` to check it with no-daemon mode. Once you've thoroughly tested your configuration you can enable the service to
start at boot.

    sudo systemctl enable thinkfan.service
