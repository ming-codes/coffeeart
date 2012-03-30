
should = require 'should'

coffeeart = require '../src/coffeeart'

describe 'compile', ->
  describe 'pretty', ->
    it 'should compile a JavaScript object into pretty CSS string', ->
      source = '''
        $['body'] =
          'width': '320px'
        
        $['ul'] =
          'list-style': 'none'
          'margin': '0px'
          'padding': '0px'
      '''
      expected = '''
        body {
          width: 320px;
        }
        ul {
          list-style: none;
          margin: 0px;
          padding: 0px;
        }

      '''

      actual = coffeeart.compile source, pretty: true

      actual.should.equal expected

  describe 'compact', ->
    it 'should compile a JavaScript object into compact CSS string', ->
      source = '''
        $['body'] =
          'width': '320px'
        
        $['ul'] =
          'list-style': 'none'
          'margin': '0px'
          'padding': '0px'
      '''
      expected = '''
        body{width:320px;}ul{list-style:none;margin:0px;padding:0px;}
      '''

      actual = coffeeart.compile source

      actual.should.equal expected

