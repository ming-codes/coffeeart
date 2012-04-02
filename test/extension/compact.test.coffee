
should = require 'should'

compact = require '../../src/extension/compact'

describe 'compact', ->
  describe 'padding', ->
    it 'should compact 4 padding properties into one', ->
      actual =
        'padding-left': '0px'
        'padding-right': '0px'
        'padding-top': '0px'
        'padding-bottom': '0px'
        
      expected =
        'padding': '0px'

      compact.padding().call actual
        
      actual.should.eql expected

    it 'should compact 2 padding properties into one', ->
