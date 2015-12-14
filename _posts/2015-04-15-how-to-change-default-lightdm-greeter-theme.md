---
layout: post
title: How to configure lightdm greeter theme
categories: Ubuntu, Unity, Lightdm
---

Ubuntu uses [Lightdm][1] as the display manager. Ubuntu also uses it's default lightdm-greeter (The UI that is displayed as User Login Page) which is named **unity-greeter**. 

Last month, I installed several DE (Desktop Environment) namely Lubuntu, LXDE, KDE, GNOME-SHELL, razor-qt and some others. As I installed those, I noticed, the default unity-greeter can't show all the available option for choosing DE. That was really frustrating. But, Anyhow, I managed to change the default lightdm theme in KDE system settings (That was an awesome option). But for a full understanding I played with it yesterday and am writing about how to change it's themes to suit your tasted


##Available greeter themes

There are several greeter themes available. Namely 
- Unity greeter theme (default)
- KDE lightdm greeter 
- GTK greeter
- webkit greeter theme
For a more complete list, [visit this link in wikipedia][2]

##Installing greeter themes
- KDE greeter  
            
            sudo apt-get install lightdm-kde-greeter
            
- GTK greeter  
            
            sudo apt-get install lightdm-gtk-greeter
            
- Webkit  
            
            sudo apt-get install lightdm-webkit-greeter
            
- RazorQt greeter  
            
            sudo apt-get install razorqt-lightdm-greeter
        
##Changing the greeter themes
Go to `/usr/share/xgreeters/` directory and check what greeter themes are available there with .desktop extension. Note the name of the greeter file. Now open `/etc/lightdm/lightdm.conf` with root permission and under `SeatDefaults` section (Yes, it is not **setDefaults**) change or add a line `greeter-session=lightdm-gtk-greeter` (assuming you wanted to use gtk-greeter). 

##Changing further in lightdm-gtk-greeter
Lightdm gtk greeter has several alternative variants. If you use gtk-greeter, you can configure theme by using this command in a terminal

{% highlight bash %}

    sudo update-alternatives --config lightdm-gtk-greeter-config-derivative

{% endhighlight %}

For a full tutorial on lightdm, check [Ubuntu-wiki page on Lightdm][3]
    

[1]:http://en.wikipedia.org/wiki/LightDM
[2]:http://en.wikipedia.org/wiki/LightDM#Available_greeters
[3]:https://wiki.ubuntu.com/LightDM