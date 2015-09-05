---
layout: post
title: Diving inside Ruby Blocks-1
catagory: Ruby 
---
New Ruby users often become confused by it's Block. So was I. Today, I determined to dive into these block thingy once more. And Alhamdulillah, I want to share with you the knowledge. Mostly, for myself.

### What is Ruby block?

Ruby block can be assumed just a method without names. It is what it's name suggests, A *code block*. This is an example of Ruby block

{% highlight ruby %}
do 
  puts "My name is Anwar"
end
{% endhighlight %}    

So, A block is delimited by `do` and `end` keyword and between these two, one or more executable statements. We can eliminate the `do` and `end` keywords, by using opening and ending curly braces. So, the previous block can also be written as

{% highlight ruby %}
{
  puts "My name is Anwar"
}
{% endhighlight %}

### Where is ruby blocks used?

Ruby blocks are used in association with method call. They never used alone. They are passed to the method. Most often, they are passed after end of the method's argument list. For example, 

    my_method(arg1, arg2) { // block code here }

### How are they executed?

When we pass a block to a method, the called method can use `yield` keyword in it's lifetime, to yield the control of the execution to the passed block. Let's go to an example.

Let's assume, we have a method named `my_method` like this - 

{% highlight ruby %}

def my_method
  puts "Hello from my_method."
  yield
end
    
{% endhighlight %}

When we pass a ruby block to this method, the control of the execution will be transferred to the block whenever execution reaches at `yield` keyword. So, if we use the method like this 

    my_method { puts "Hello from block." } 

The resulting output will be

{% highlight bash %}
$ Hello from my_method.
$ Hello from block.
{% endhighlight %}

Nice! Isn't it?

### Why should I care? I have methods!
Well, at first it seems blocks are redundant because we have methods already. Actually it's not. Block are very useful tools and can be used in cases, where a method can't be used.

One such case is, you can use a single method for different purposes by cleverly using a block. Both Ruby language and Ruby on Rails framework extensively use this feature. You use this all the time in many enumerable methods.

#### Example:

Let's assume, you have an array of numbers, and you want to use those numbers in various ways. You want products of them, sum of them, sum of the odd numbers in them. Normally, You need to create a method for each cases, but You can use blocks instead. Let's look at an example.

I have an array of numbers here

{% highlight ruby %}
numbers = [2, 1, 3, 4, 5, 6, 8, 10]
{% endhighlight %}

To run various mathematical operation, I defined a generic method `calculate`, which takes the array in argument (and of course a block) and iterates through the array and call the block for each element in the array, finally returns the accumulated result. The fun part is, `calculate` method doesn't know anything about the operation I'll do on the array.

I'll call the method like 

    calculate(numbers, 1) { |result, elem| result += elem }

and it'll return sum of the elements of the array. I change `+` sign to `*` (asterisk) sign, it'll return the product of all element. Pretty impressive, no?

The implementation of the method is here

{% highlight ruby %}
def calculate(num_arr, init_value = 0)
  result = init_value
  iter = 0
  while iter < num_arr.length
    result = yield(result, num_arr[iter])
    iter += 1 
  end
  result
end
{% endhighlight %}

When we use this in **irb**, it results 

{% highlight ruby %}
puts calculate(numbers, 1) { |result, elem| result *= elem }
=> 57600
{% endhighlight %}

### Fun with core classes

Let us, inject a method on Ruby's *String* class. The method will return the original string, concatenated with our injected message at the end. 

{% highlight ruby %}
class String
  def mystr
    self + " (custom method)"
  end
end
{% endhighlight ruby %}

And executing this with "Hello" string results in 

{% highlight bash %}
"Hello".mystr
=> "Hello (custom method)"
{% endhighlight %}

What if we want to use our very own messages instead of that fixed one? Well, Here comes block. We will modify the method a bit, creating chance to get the block executed.

{% highlight ruby %}
class String
  def mystr
      self + yield
  end
end
{% endhighlight ruby %}

Then we can use this like 

    "Hello".mystr { " World" }

it will give us

    => "Hello World"

That's the end of the story. I'll write another post with blocks, InShaAllah. 