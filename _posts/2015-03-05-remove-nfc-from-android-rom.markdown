---
layout: post
date: 2015-03-05
title: How to remove NFC completely from Android Rom
catagories: Android
author: Mohammad Anwar Shah
---
If you want to get rid of battery-hungry nfc completely, remove these files from
your Android Rom. Of course, You need root access to do this.

Files to remove:

{% highlight bash %}
/system/etc/nfcee_access.xml
/system/etc/permissions/android.hardware.nfc.xml
/system/etc/permissions/com.cyanogenmod.nfc.enhanced.xml
/system/lib/hw/nfc.default.so
/system/lib/libnfc.so
/system/lib/libnfc_jni.so
/system/lib/libnfc_ndef.so
/system/app/nfc.apk
/system/app/tags.apk
{% endhighlight %}

###<span style="color: red;">WARNING</span>: This Guide is not for everybody!
