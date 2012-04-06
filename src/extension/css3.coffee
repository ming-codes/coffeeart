
warn = (prop, vendor) ->

exports['border-radius'] = ({vendors}) ->
  (input) ->
    @['border-radius'] = input
    @['-webkit-border-radius'] = input if not vendors or ~vendors.indexOf('webkit')
    @['-moz-border-radius'] = input if not vendors or ~vendors.indexOf('moz')

exports['box-sizing'] = ({vendors}) ->
  (input) ->
    @['box-sizing'] = input
    @['-webkit-box-sizing'] = input if not vendors or ~vendors.indexOf('webkit')
    @['-moz-box-sizing'] = input if not vendors or ~vendors.indexOf('moz')

exports['box-shadow'] = ({vendors}) ->
  (input) ->
    @['box-shadow'] = input
    @['-webkit-box-shadow'] = input if not vendors or ~vendors.indexOf('webkit')
    @['-moz-box-shadow'] = input if not vendors or ~vendors.indexOf('moz')

exports['background-size'] = ({vendors}) ->
  (input) ->
    @['background-size'] = input
    @['-webkit-background-size'] = input if not vendors or ~vendors.indexOf('webkit')
    @['-moz-background-size'] = input if not vendors or ~vendors.indexOf('moz')

exports['text-overflow'] = ({vendors}) ->
  (input) ->
    @['text-overflow'] = input
    @['-webkit-text-overflow'] = input if not vendors or ~vendors.indexOf('webkit')
    @['-moz-text-overflow'] = input if not vendors or ~vendors.indexOf('moz')

exports['transform'] = ({vendors}) ->
  (input) ->
    @['-webkit-transform'] = input if not vendors or ~vendors.indexOf('webkit')
    @['-moz-transform'] = input if not vendors or ~vendors.indexOf('moz')
    @['-ms-transform'] = input if not vendors or ~vendors.indexOf('ms')
    @['-o-transform'] = input if not vendors or ~vendors.indexOf('o')

###
TODO Template
exports[''] = ({vendors}) ->
  (input) ->
###
