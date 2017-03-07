---
layout: post
title: Notes from 99 bottles of OOP
categories: oop ruby clean-code notes
---
This is a post of notes I am taking from the book, **99 bottles of OOP** by Sandi Metz and Katrina Owen.
I'm hoping that I can finish it timely and also complete the post with all notes.

##Chapter 1: Shameless Green
4 solutions are discussed for 99 bottles of bear problem. _(I'm not including the solutions here and discussions
specific to them )_

1. Incomprehensibly Concise
2. Speculatively General
3. Concretely Abstract
4. Shameless Green

####Problems with _Incomprehensibly Concise_

#####Consistency

   The style of conditionals is incosistent. Sometimes used ternary sometimes `if` at end.

#####Duplication

  - Duplication of both data and logic was there.
  - Itentifying duplication of logic is harder. The maximum confusion can be *acheived* by using the logic in interpoted string

#####Names

  - No uses of names. Name is the identification of concept in the problem.
  - Code clarity is built upon good names.
  - Good naming is hard, but also worth the effort.

####Messages vs Methods

Although we used to think about `messages` as `methods`, the authors separated between the two.

  - A ***message*** is sent by an object to another to invoke a behavior.
  - A ***method*** is an object's internal implementation which may or may not corresponds to the method.
  it is not required for the method be same named as message.
  - Think about objects as black box. Separate the concept of *message* and *method* to get better
  OO mindset.

 ***Methods are defined, but messages are sent***

####Juding Code: Three basic questions to help

The best way to judge code is by comparing its *value* to its *cost*. while it's difficult to get exact
figure for value and cost, we can ask three questions to find insight about the potential expense of
a slice of code.

   1. How difficult was it to write?
   2. How hard is it to understand?
   3. How expensive will it be to change?

 ***Code is easy to understand when it clearly reflects the problem it's solving and thus openly
  exposes that problem's domain.***

####Problems with _Speculatively General_

_The authors then brought another solution which was relatively easier to understand but uses
more levels of indirections between actual works. The indirections made whole picture incomprehensible
to grasp all at once._

***You must resist being clever for its own sake.*** 

If you are capable of conceiving and implementing a complex solution,
it is incumbent upon you to accept the ***harder*** task and write simpler code.

####Problems with _Concretely Abstract_

The next solution authors brought was characterized by many small methods and completely DRY-ed
codes. But it has its own problems.

One of the method was named `beer` which returns the string `"beer,"`. Though this DRY-ed up the code
it could't reap the benefit. Because if the implemention of it is changed from `"beer"` to `"Kool-Aid"`,
the method can be changed to

{% highlight ruby %}
def beer
  "Kool-Aid"
end
{% endhighlight %}

but what to do with all these method names?

{% highlight ruby %}
def bottles_of_beer
def buy_new_beer
def drink_beer
def last_beer?
{% endhighlight %}

The problem was the methods were named with current implmentation while it was trying being DRY-ied
for future changes.

***When you name a method after its current implementation, you could never change that
internal implementation without ruining the method name.***

You should name method not after what they do, but after what they mean in your problem domain.

####On _Shameless Green_

When you dry out duplication or create a method to name a bit of code, you add a level of indirection
that make it more abstract. In theory, this abstractions make code easier to understand and change, but
it practice they often acheive the opposite.

The biggest challenge is to determine when to stop abstracting.

####Evaluating Code based on facts

Three metrices

  1. SLOC or LOC (Source Line of Code) _(Not very useful)_
  2. Cyclomatic Complexity. Measures the conditions in a chunk of code. Higher score ~ More complex
  3. ABC metrics (Assignments, Branches and Conditionals). Takes all three into accounts. Better.

`FLOG` is a ruby companion based on ABC.

***Checking metrics regularly will keep you humble and improve your code.***

####Chapter Summary

Experience programmers tend to write complex code because that seems natural to them. However,
there is something beyond complexity.

_Infinitely experienced programmers do not write infinitely complex code; they write code that's
blindingly simple._ 
