---
layout: post
title: How to make Firefox's zoom settings persistent or saved
---

When you make changes to a site's zoom settings, that change will not be saved for all pages of that particular site and, of course not across all the other sites too. This is particularly problemetic for site's whose has low sized fonts such as Django's offline documenation site. You have to zoom everytime  you navigate around sites.

As a remedy of this, follow the steps:

1. Open a new tab and type `about:config` in the location and press Enter.
2. Ignore the warning by continuing. 
3. In the new search box (not the one which is beside location bar) type `zoom`.
4. You will see fewer preference names. Select the one with **browser.zoom.siteSpecific** and double click it to change the value to **false**
5. Close the tab and done!

