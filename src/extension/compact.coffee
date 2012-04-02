
exports['padding'] = (options) ->
  ->
    padding = @['padding']

    left = @['padding-left']
    right = @['padding-right']
    top = @['padding-top']
    bottom = @['padding-bottom']

    if top and top is bottom is left is right
      @['padding'] = top

      delete @['padding-left']
      delete @['padding-right']
      delete @['padding-top']
      delete @['padding-bottom']

exports['margin'] = (options) ->
  ->

exports['background'] = (options) ->
  (declaration) ->

exports['border'] = (options) ->
  (declaration) ->

exports['outline'] = (options) ->
  (declaration) ->

exports['list-style'] = (options) ->
  (declaration) ->

