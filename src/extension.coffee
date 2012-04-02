
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

# Each extension should have the following signature:
# 
#     exports['name'] = (options) ->
#       (input) ->
#
# The extension should be a function that returns a function.
# The first function will be called with the configuration option passed in. The returned function
# is the real function that's going to be used by CoffeeArt. The returned function may optionally return
# another function that will used in next pass. This allows certain extensions to pass the first pass and
# run only after other extensions have worked on it.
# This allows you to develop extensions that can be configured.
# The options object is the same options object passed into compile and middleware.
#
# The exte

exports['compact'] = require './extension/compact'
