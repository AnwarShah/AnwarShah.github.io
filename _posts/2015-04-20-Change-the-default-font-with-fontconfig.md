---
layout: post
title: How to change the default font using font-config
categories: anti-aliasing, ubuntu, font-config
---

If you want to replace the default font used for a certain family such as **sans-serif** or **monospace** or just want to replace every occurrence of a font, you need to deal with **font-config**. This is very simple.

First you need to create a file with name `fonts.conf` in `~/.config/fontconfig` folder. If that file exists, You have to add contents between `<fontconfig>..</fontconfig>` Tag. 

To replace Ubuntu font with Aller, Your font config should have the lines between the `<fontconfig>` tags.

{% highlight xml %}
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
    <match target="pattern" name="family">
        <test name="family" qual="any">
          <string>Ubuntu</string>
        </test>
        <edit name="family" mode="assign" binding="strong">
          <string>Aller</string>
        </edit>
  </match>
</fontconfig>
{% endhighlight %}
For a detailed information, Have a look a font-config manual page. 