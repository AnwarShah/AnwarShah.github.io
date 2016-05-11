---
layout: post
title: How to generate Rails documentation with Yardoc
categories: ruby-on-rails
---

The default `rake doc:rails` generate api documentation for rails using **sdoc** format. But, if you want to get yardoc formatted api documentation, you need to generate it manually. One way to generate this api documentation is by navigating to rails source and using the command `yard doc`. Assuming you are using `rvm` to manage rubies and gems, It's not easy, Because rvm store all gems including rails dependencies in a single directory. That makes it hard to filter which comes with rails and which are not. For example, `action-controller` is a rails component but `yard` is not. But all lives in the same `gems` folder.

We need to get the source of the rails. The simplest and bandwidth friendly option is going to the [rails release page](https://github.com/rails/rails/releases) and download the version you need. Then extract the downloaded archive and by `cd`-ing to the extracted folder, use `yard doc` to generate the documentations. The docs will be in a new folder named `doc`.