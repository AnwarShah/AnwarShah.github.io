---
layout: post
title: Referencing outside controller from inside namespace
categories: ruby-on-rails
---

Yesterday, I came across a case where I needed to refer to an outside controller's action from a namespaced view. 
It is actually a form, which submits data. So, I needed to use `post` method. 

I updated the route accordingly. Changed the form's url option, refreshed!

But no! that didn't work! 

## Wouldn't work
I used something like this, let `:admin` be the namespace.

{% highlight ruby %}

# route.rb file
# this didn't work
post 'upload_document/:id', to: "documents#upload", as: 'upload_document' 

{% endhighlight %}

In the form, I used `upload_document_path` which didn't work. Neither this one -
{% highlight erb %}
<%= form_for :registration, url: {controller: 'documents', action: 'upload'} do |f| %>
.
.
.
<% end %>
{% endhighlight %}

## The solution
The solution to this problem was very simple one, but is also tricky.

I had to add a small '/' before the controller name. So the changed form_helper line becomes - 
{% highlight erb %}
<%= form_for :registration, url: {controller: '/documents', action: 'upload'} do |f| %>
.
.
.
<% end %>
{% endhighlight %}

So, to route from inside a namespaced path to outer controller, we should use `/controller_name`
instead of just `controller_name`.

Hope, this will help someone.