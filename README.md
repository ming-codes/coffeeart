
# CoffeeArt

CoffeeArt is a simple light weight CSS generation written in CoffeeScript

# Why CoffeeScript?

Because it's awesome!

Also because I like to use [docco](http://jashkenas.github.com/docco/) to generate inline documentation for scripts. This, together with the use of [CoffeeKup](https://github.com/mauricemach/coffeekup), is a powerful combination.

# Design Philosophy

The primary design goal of CoffeeArt is to be simple and elegant. This also means that many features seen in other CSS frameworks are intensionally left out. 

# Usage

Your CoffeeScript will be passed in a variable named $ in the context scope. This is just an empty JavaScript object you'll use to populate your stylesheet with.

## Simple Examples

    # Simple Example
    # A stylesheet is simply a giant JavaScript object
    # Here I chose $ as the object to use to stay consistant
    # with jQuery's syntax
    $['#header'] =
      'padding': '10px'
      'position': 'relative'
    $['#header ul'] =
      'clear': 'both'
    $['#upcoming'] =
      'margin': '10px'
      'padding': '15px'
      'background': 'white'

## Connect Middleware is available

    express = require 'express'
    coffeeart = require 'coffeeart'

    app = express.createServer coffeeart.middleware
      pretty: true
      extension: ['css3']

## JavaScript/CoffeeScript API is available as well

    coffeeart = require 'coffeeart'

    coffeeart.compile source,
      pretty: true
      extension: ['css3']

# What's new

* Refactored core functionalities into lib module.
* Added connect middleware
* Made everything more coffee.

# TODO

* CSS3 stuff will be implemented as separate module.

# License

Copyright (c) 2012 Ming Liu

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



<!--
## DRAFT
Problem with nesting: http://www.markdotto.com/2010/12/18/the-problem-with-nesting-css-with-less-or-sass/
-->
