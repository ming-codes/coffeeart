
fs = require 'fs'
url = require 'url'
path = require 'path'
vm = require 'vm'

coffee = require 'coffee-script'

# Pretty print CSS
pretty = ($, extension = {}) ->
  buf = ''

  for selector, declarations of $
    buf += selector + ' {\n'

    for key, value of declarations
      if extension[key] then buf += "  #{key}: #{extension[key] value};\n"
      else if value then buf += "  #{key}: #{value};\n"

    buf +=  '}\n'

  buf

# Compact print CSS
compact = ($, extension = {}) ->
  buf = ''

  for selector, declarations of $
    buf += selector + '{'

    for key, value of declarations
      if extension[key] then buf += "#{key}:#{extension[key] value};"
      else if value then buf += "#{key}:#{value};"

    buf += '}'

  buf

extend = (extensions = {}, options = {}) ->
  extension = require './extension'

  reduce = (prev, ext) ->
    switch typeof extension
      when 'string' then prev[ext] = extension[ext]
      when 'object' then prev[key] = value options for key, value of ext

    prev

  if Array.isArray extensions then extensions.reduce reduce, {}
  else extensions

# Extensions
# You may add any number of extensions to CoffeeArt. Each
# extension must have the following signature:
#
# * should also allow to extend bundled extension
# * Simple string: this will lookup for a CoffeeArt bundled extension
# * 'name': function() {}
#     * A named function will be called when a matching
#       CSS property is found within a CSS declaration. 
#       The value of the CSS property will be passed in to
#       the function and the context object will be set
#       as the declaration object. At the same time, the
#       function will also be attached to each CoffeeArt
#       's context object so you can call it directly
#       TODO may pass in a continuation object
#       TODO may return a continuation function to be called during compacting phase

exports.compile = compile = (source, options = {}) ->
  source = coffee.compile source

  extension = if options.extension then extend options.extension else {}
  context = Object.create extension,
    '$':
      value: $ = {}
      writable: false
      enumerable: true

  vm.runInNewContext source, context

  if options.pretty then pretty $, extension
  else compact $, extension

exports.middleware = middleware = (options = {}) ->
  (req, res, next) ->
    unless {'GET': 1, 'HEAD': 1}[req.method] then next()
    else if /\.css$/.test(pathname = url.parse(req.url).pathname)
      dest = path.resolve(options.source or './public/', ".#{pathname}")
      source = dest.replace(/\.css$/, '.coffee')

      # In here, we need to check 2 conditions
      # 1. The source file must exist
      # 2. The destination file must NOT exist
      fs.readFile source, 'utf8', (err, data) ->
        # If the err is not file not found
        if err and err.code isnt 'ENOENT' then next err
        else if data
          fs.writeFile dest, compile(data), 'utf8', (err) ->
            if err then next err
            else next()
        else next()

    else next()
