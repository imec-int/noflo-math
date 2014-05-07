noflo = require 'noflo'

class Modulo extends noflo.Component
  description: 'divde and remainder'
  icon: 'fa-level-down'

  constructor: ->
    @divider = 1

    @inPorts =
      value: new noflo.Port 'integer'
      divider: new noflo.Port 'integer'
    @outPorts =
      result: new noflo.Port 'integer'
      remainder: new noflo.Port 'integer'


    @inPorts.value.on 'data', (data) =>
      @outPorts.result.send Math.floor data/@divider
      @outPorts.remainder.send value % @divider

    @inPorts.divider.on 'data', (data) =>
      @divider = data


exports.getComponent = -> new Modulo
