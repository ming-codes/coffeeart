
fs = require 'fs'
url = require 'url'
path = require 'path'
vm = require 'vm'

coffee = require 'coffee-script'

pretty = ($) ->
  buf = ''

  for selector, declarations of $
    buf += selector + ' {\n'

    for key, value of declarations
      buf += "  #{key}: #{value};\n"

    buf +=  '}\n'

  buf

compact = ($) ->
  buf = ''

  for selector, declarations of $
    buf += selector + '{'

    for key, value of declarations
      buf += "#{key}:#{value};"

    buf += '}'

  buf

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
