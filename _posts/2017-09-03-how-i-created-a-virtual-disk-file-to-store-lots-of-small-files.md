---
layout: post
title: How I created a virtual disk file to store lots of small files
categories: [linux, file-systems, xfs]
permalink: /2017/09/03/file-system-for-lots-of-small-files/
---
###Prelude
{: style="text-align: center;" }
I was experimenting with several Linux distribution at the moment. I installed Ubuntu 17.04, Fedora 26, openSUSE 42.3 and
Manjaro Linux deepin edition. I was sharing a lot of things among the distributions, one of them is `/opt`.

###Sharing themes with shared partition
One of the first problem I encountered was with my favorite themes and icons. As I was willing
to use them in all distribution, this will wastes a lot of disk spaces between the distributions if I were going to duplicate the
themes in all of them. So, I tried a solution by creating a shared partition of icons and themes and linking them to standard
location in all distribution

###Lots of small files consumed all the inodes
The problem is, I needed around 10GB partition for all icons, but with ext4 file system, I quickly ran out
of the inodes (because many of icons are packages of lots of small files). What options do I have?

####Partial solution 1: ISO files
As a solution I created iso files for most offending icon theme and mounted them via `udisksctl` at startup. That was sufficient to
workaround the problem.

###Need to make change in theme folder

The solution was great until I encountered a situation where I needed to change a small file in an icon
theme. It's not possible with the iso solution. So, what then?

####Partial Solution 2: Virtual disk files
I thought about creating a read-writable virtual disk file and mounting that instead of the iso at startup.

So, I proceeded to create one with `mkfs.ext4` and created a disk file sufficiently large to hold the icon theme plus some modification.
I needed around 35MB disk file. Creating it with `dd` and `mkfs.ext4` was typical.

    dd if=/dev/zero of=Hedera.img bs=1M count=35
    mkfs.ext4 -L Hedera Hedera.img

###Problem with inode limit with small disk files

I mounted it and tried to copy the icon files. But I quickly ran out of inode limit because the theme was of around 35k inode counts!

####The solution for inode limit

So I looked around and learned abut the `xfs` filesystem. It was said that it supports large number of
inodes. After researching some more minutes, the below command works as expected.

    mkfs.xfs -m crc=0 -b size=512 -i maxpct=50 -L Hedera Hedera.img

  + `-m crc=0` disables crc, which is required for block size < 1024 bytes (I used 512 bytes)
  + `-b size=512` sets block size to 512 bytes, which is required to store lots of small files
  + `-i maxpct=50` raises inode size limit to 50% of the filesystem size
  + `-L Hedera` sets the label of the filesystem "Hedera"

That worked flawlessly and I'm using the theme just fine.