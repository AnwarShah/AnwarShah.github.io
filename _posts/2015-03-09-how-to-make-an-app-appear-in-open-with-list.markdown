---
layout: post
date: 2015-03-09
title: How to make an application appear in OpenWith list in Ubuntu
catagories: Ubuntu
---

Ubuntu's latest releases make it difficult to add an application in Nautilus's OpenWith list. However, We could make an application appear there anyway. Follow 

1. Go to /usr/share/applications directory. You will see many icons there. These are called .desktop files
2. Open an application and `cd` to that directory i.e `cd /usr/share/applications`
3. Open the respective application's .desktop file. For Gedit, it is `gedit.desktop`. For the old adobe reader for Linux, it is `acroread.desktop`. I am going to add this.
4. Open that .desktop file. In my case, it is `acroread.desktop`.
5. Find the line with `Exec=` option. In my case it is `Exec=acroread`. 
6. Add `%u` after that application's name. For example, change it to `Exec=acroread %u`
7. Save and Exit. You will see that application's name in Open With list now