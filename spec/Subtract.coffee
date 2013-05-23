noflo = require 'noflo'
if typeof process is 'object' and process.title is 'node'
  chai = require 'chai' unless chai
  Subtract = require '../components/Subtract.coffee'
else
  Subtract = require 'noflo-math/components/Subtract.js'

describe 'Subtract component', ->
  c = null
  minuend = null
  subtrahend = null
  difference = null
  beforeEach ->
    c = Subtract.getComponent()
    minuend = noflo.internalSocket.createSocket()
    subtrahend = noflo.internalSocket.createSocket()
    difference = noflo.internalSocket.createSocket()
    c.inPorts.minuend.attach minuend
    c.inPorts.subtrahend.attach subtrahend
    c.outPorts.difference.attach difference

  describe 'when instantiated', ->
    it 'should not hold values', ->
      chai.expect(c.minuend).to.be.a 'null'
      chai.expect(c.subtrahend).to.be.a 'null'
    it 'should calculate 2 + 5', (done) ->
      difference.once 'data', (res) ->
        chai.expect(res).to.equal -3
        done()
      minuend.send 2
      subtrahend.send 5
