
fs = require 'fs'
url = require 'url'
path = require 'path'
vm = require 'vm'

coffee = require 'coffee-script'

# Pretty print CSS
pretty = ($) ->
  buf = ''

  for selector, declarations of $
    buf += selector + ' {\n'

    for key, value of declarations
      buf += "  #{key}: #{value};\n" if value

    buf +=  '}\n'

  buf

# Compact print CSS
compact = ($) ->
  buf = ''

  for selector, declarations of $
    buf += selector + '{'

    for key, value of declarations
      buf += "#{key}:#{value};" if value

    buf += '}'

  buf

# Extensions
# You may add any number of extensions to CoffeeArt. Each
# extension must have the following signature:
#
# * 'name': function() {}
#     * A named function will be called when a matching
#       CSS property is found within a CSS declaration. 
#       The value of the CSS property will be passed in to
#       the function and the context object will be set
#       as the declaration object. At the same time, the
#       function will also be attached to each CoffeeArt
#       's context object so you can call it directly
#       TODO may pass in a continuation object
exports.extension = []

exports.compile = compile = (source, options = {}) ->
  source = coffee.compile source

  vm.runInNewContext source,
    $: $ = {}

  if options.pretty then pretty $
  else compact $

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
