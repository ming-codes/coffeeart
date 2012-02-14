
underscore = require 'underscore'

# {pretty} pretty print output
# {compress} attempt to compress output by merging values
# {extensions} array of extensions to properties
exports.compile = compile = (art, {pretty, compress, extension}) ->
  extension = extension or {}
  buffer = ''

  for selector, properties of art
    block = underscore.compact do ->
      for key, value of properties
        "  #{key}: #{value};\n"

    buffer += """
      #{selector} {
      #{block.join ''}
      }\n
    """

  buffer


