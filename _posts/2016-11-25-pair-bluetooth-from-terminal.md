---
layout: post
title: How to pair a bluetooth device from terminal
categories: bluetooth linux command-line
---

Bluetooth has been a headace for us all. Works sometimes and doesn't work some other times. Here I'm creating a checklist of tasks to successfully connect a bluetooth device in Linux. I've tested this in Ubuntu 16.04.

## Make sure bluetooth device is turned on physically.

You can check it using `dmesg -w` command while connecting the device or turning on the hardware switch. Some laptops have two switches for bluetooth.
One hardware and another via keyboard shortcut. You should see bluetooth related messages in the output.

## Make sure bluetooth is not blocked by `rfkill`
`rfkill` is a tool that is used to enable or disable wireless devices. TLP, the modern power management utility being used in Linux these days can block it. The configuration file can be found in `/etc/default/tlp` file. Search for a line like this `DEVICES_TO_DISABLE_ON_STARTUP="wifi bluetooth"`. Remove the `bluetooth` from the line.

If it is already blocked, you can unblock the device using this command
{% highlight bash %}
rfkill unblock bluetooth
{% endhighlight %}

## Use `bluetoothctl` to pair.

Use this sequence of command to get the device paired
{% highlight bash %}
$ bluetoothctl
[NEW] Controller 00:15:83:15:A3:10 raspberrypi [default]
[NEW] Device 7C:1E:52:0B:0D:97 Microsoft Wedge Mobile Keyboard
[bluetooth]# agent on
Agent registered
[bluetooth]# default-agent
Default agent request successful
[bluetooth]# pairable on
Changing pairable on succeeded
[bluetooth]# scan on
Discovery started
[CHG] Controller 00:15:83:15:A3:10 Discovering: yes
[CHG] Device 7C:1E:52:0B:0D:97 LegacyPairing: yes
[CHG] Device 7C:1E:52:0B:0D:97 Class: 0x002540
[CHG] Device 7C:1E:52:0B:0D:97 Icon: input-keyboard
[bluetooth]# pair 7C:1E:52:0B:0D:97
Attempting to pair with 7C:1E:52:0B:0D:97
[CHG] Device 7C:1E:52:0B:0D:97 Connected: yes
[agent] PIN code: 953853
[CHG] Device 7C:1E:52:0B:0D:97 Paired: yes
Pairing successful
[CHG] Device 7C:1E:52:0B:0D:97 Connected: no
[bluetooth]# connect 7C:1E:52:0B:0D:97
Attempting to connect to 7C:1E:52:0B:0D:97
[CHG] Device 7C:1E:52:0B:0D:97 Connected: yes
Connection successful
[bluetooth]# quit
{% endhighlight %}

Here `[bluetooth]` indicates that you're in bluetoothctl's interactive mode. The output is copied from a raspberry pi forum thread and could be different.


