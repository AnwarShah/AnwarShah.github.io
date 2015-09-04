---
layout: post
title: Using form_for for nested resources in rails
catagories: ruby-on-rails, rails-4
---

Using object with `form_for` in rails in really nice things. But, it can get tricky when we need a form for nested resources. For example, we could have a `@result` resource, inside a `@course` resource. What should be done in these cases? 

Rails guide gives us a hint at [here](guides.rubyonrails.org/form_helpers.html#relying-on-record-identification). The answer from this [StackOverflow question](http://stackoverflow.com/questions/2034700/form-for-with-nested-resources) also suggests same. But it has a gotcha!

I was trying to use the same form for a smart-join table (a join table with identifying objects). The table is `results` and both `students` and `courses` has many of them. So, I want a two-way implementation of inputting result. 

1. Going from course side and inputting result for all of the enrolled students for that course

2. From Student side and inputting results for all courses of that particular student.

And **I want to use the same form**. Here, the problem arise. Should I use `form_for([@course, @result])` or `form_form([@student, @result])`? 

The problem is solved by using just the object for the form, i.e `@result` and using url: option to fix route.

So, I finally used 
    
    {% highlight ruby %}
    form_for(@result, url: {action: "create"}) 
    {% endhighlight %}

Which is much more convenient. I wish, I had known this before! 

Hope, this helps some other rails folks!