Clock = require './clock'
require! 'events'.EventEmitter

class CountdownTimer extends EventEmitter
  (@_timeout, {@_clock = new Clock} = {}) ->
    @_time-left = -1
    @_clock.on \tick @~_tick

  start: ->
    @_time-left = @_timeout
    @_clock.start!

  time-left: -> @_time-left

  is-running: -> @time-left! > 0

  _tick: ->
    @_time-left --
    @emit \each-second, @_time-left
    @_stop! if @_time-left is 0

  _stop: ->
    @emit \timeout
    @_clock.stop!

module.exports = CountdownTimer