
# Extensions
# You may add any number of extensions to CoffeeArt. Each
# extension must have the following signature:
#
# Each extension should have the following signature:
# 
#     # extension :: Object -> (String -> void)
#     exports['name'] = (options) ->
#       (input) ->
#
# The extension function shall be a function that returns a function. The first
# function will be called with the configuration option passed in. The returned function
# is the real function that's going to be used by CoffeeArt. This allows you to develop
# extensions that can be configured by developer.
#
# TODO Planned Feature
# The returned function may optionally return another function that will used in
# next pass. This allows certain extensions to pass the first pass and
# run only after other extensions have worked on it.

exports['css3'] = require './extension/css3'
