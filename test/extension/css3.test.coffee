
should = require 'should'

css3 = require '../../src/extension/css3'

describe 'border-radius', ->
  it 'should generate vendor specific properties for border-radius', ->
    $ = {}

    br = css3['border-radius'](vendors: ['webkit', 'moz', 'ms', 'o'])
    br = br.call($, '5px')

    $.should.have.property('-webkit-border-radius').equal('5px')

