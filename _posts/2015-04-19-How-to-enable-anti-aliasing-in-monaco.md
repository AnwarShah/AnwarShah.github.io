---
layout: post
title: How to enable anti-aliasing for Monaco font in Ubuntu
categories: anti-aliasing, monaco, ubuntu, font-config
---

[Monaco][monaco] was the standard monospace typeface installed by default in Apple computers until it is replaced by [Menlo][menlo] in Mac OSX 10.6 (*Snow Leopard*) . But, This font, when used in Ubuntu, renders pixelated in small sizes (to be accurate, sizes less that 14px). This is quiet dissapointing since it is a very nice font. Below is a picture of the problem.

![Problematic monaco font in Ubuntu](/img/problematic-monaco.png)

I've been looking for a solution to this problem for a long time. However, I found solution from ArchLinux font-wiki page. 

###Solution:


First create a file in **.config/fontconfig/conf.d/** directory with **20-no-embedded.conf** name.

Then put the below lines in the file to disable embedded bitmaps for all fonts.(If you don't want to disable for all fonts, but for some fonts, skip this to the next)

{% highlight xml %}
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <edit name="embeddedbitmap" mode="assign">
      <bool>false</bool>
    </edit>
  </match>
</fontconfig>
{% endhighlight %}

(Alternative) If you don't want to disable for all fonts, but only for a specific font, you should instead use these 

{% highlight xml %}
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <match target="font">
        <test qual="any" name="family">
           <string>Monaco</string>
        </test>
        <edit name="embeddedbitmap">
            <bool>false</bool>
        </edit>
    </match>
</fontconfig>
{% endhighlight %}

Below is a picture after successfully enabling anti-aliasing for Monaco. Have fun!

![Monaco problem solved image](/img/solved-monaco-problem.png)

#####Note: The same fix could be used for Microsoft's Calibri and Cambria fonts

If you want to know more, check out [ArchLinux's fontconfig wiki page][1]

As a bonus, Take a look at [this page][4] for suggestion on beautiful monospace fonts! 

[1]:https://wiki.archlinux.org/index.php/Font_configuration
[monaco]:http://en.wikipedia.org/wiki/Monaco_%28typeface%29
[menlo]:http://en.wikipedia.org/wiki/Menlo_(typeface)
[4]:https://www.kuro5hin.org/story/2004/12/6/11739/5249