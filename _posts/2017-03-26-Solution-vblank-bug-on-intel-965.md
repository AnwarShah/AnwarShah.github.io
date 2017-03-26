---
layout: post
title: Long awaited solution to "vblank wait timed out on crtc" bug on Intel 965 chipsets found
categories: [linux, kernel, bug]
permalink: /2017/03/26/solution-to-vblank-bug/
---

The long awaited notorious `vblank wait timed out on crtc` bug has finally got some working solution. Thanks to all users across the globe who constantly tested various solutions. This bug hangs the system for several seconds when user tries to switch virtual consoles or when starts playing a video file.

I previously searched for the solution, but failed. No kernel boot parameter solved this. So, for a while I switched to using kernel 4.1* despite security risks. But after I accidentally cleared by hard disk, I needed to start from scratch. So I've given another try and it seems several users have found effective solution.

The solution is simple actually. Just add this to boot parameter.

    video=SVIDEO-1:d

On Ubuntu, you'll add this to the file `/etc/default/grub` file for the key `GRUB_CMDLINE_LINUX_DEFAULT`. So, if you were using defualt settings, it would become like this after changed.

    GRUB_CMDLINE_LINUX_DEFAULT="splash video=SVIDEO-1:d"

Then a `sudo update-grub` command will update the grub config file used for boot. Restart and see the result!

-------------

Here is the reports where solution is reported -

- [https://bugs.freedesktop.org/show_bug.cgi?id=96441](https://bugs.freedesktop.org/show_bug.cgi?id=96441)
- [https://bugzilla.redhat.com/show_bug.cgi?id=1342755](https://bugzilla.redhat.com/show_bug.cgi?id=1342755)
- [https://bugs.freedesktop.org/show_bug.cgi?id=93782#c40](https://bugs.freedesktop.org/show_bug.cgi?id=93782#c40)