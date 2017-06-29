---
layout: post
title: Installing and configuring pantheon greeter
categories: [linux, lightdm, pantheon, greeter, elementary]
permalink: /2017/06/29/installing-configuring-pantheon-greeter/
---
[`lightdm`][lightdm] is a display manager that handles running X server and login in Linux systems. The flexbility of lightdm allowed it to be used with different greeters (login screen). Though the default is Unity greeter, not every distribution uses it as default. [Elementary OS][elementary] project uses their own fork, named *[pantheon greeter][pantheon-greeter]*, which in my opinion is most visually appealing.

Fortunately, you can have it in Ubuntu by installing `pantheon-greeter` package. 

{% highlight bash %}
sudo apt-get install pantheon-greeter
{% endhighlight %}

But setting it as default greeter and configuring it needs some work.

###Setting as default greeter

Open the `/etc/lightdm/lightdm.conf` file and Use these lines to set it as default.


{% highlight ini %}
[Seat:*]
greeter-session=pantheon-greeter
{% endhighlight %}

### Configuring some options

You can change or configure some options of the greeter if you want. The pantheon greeter looks better with elementary theme, so make sure you have it installed. To change some options like the font sizes, gtk themes, icon themes etc use `/etc/gtk-3.0/settings.ini` file.

Content of the file should look like this by default

{% highlight ini %}
[Settings]
gtk-theme-name = elementary
gtk-icon-theme-name = elementary
gtk-fallback-icon-theme = gnome
gtk-sound-theme-name = ubuntu
gtk-icon-sizes = panel-menu-bar=24,24
gtk-font-name = Open Sans 9
{% endhighlight %}

So, if you want to change the font name or icon name, change it there and save. Then reload or restart lightdm to see the effect.

Happy tweaking!


[lightdm]:https://www.freedesktop.org/wiki/Software/LightDM/
[elementary]:https://elementary.io/
[pantheon-greeter]:https://launchpad.net/pantheon-greeter