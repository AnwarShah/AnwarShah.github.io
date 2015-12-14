---
layout: post
title: How to disable all the PPAs at once
date : 2015-02-27 23:07:00
categories: Ubuntu, Linux
author: Mohammad Anwar Shah
permalink: how-to-disable-all-repo-at-once.html
---
When you want to update your Ubuntu system, you need to disable all the PPAs that you enabled while using for smoother update experience and avoid problems. So, you need to disable all the PPAs by toggling the checkboxes in the `software-properties-gtk` program. But it is a tedious work.

You can actually do this same thing quite easily. Follow this -  

1. Open a terminal using <kbd>Ctrl+Alt+Tab</kbd>
2. `cd` to the `/etc/apt/sources.list.d` directory using command  
        {% highlight bash %}
        cd /etc/apt/sources.list.d
        {% endhighlight %}
3. While in that directory use the following command to put a `#` in front of every `deb` lines  
        {% highlight bash %}
        sudo sed -i 's/^deb/#deb/' *
        {% endhighlight %}
Voila!
