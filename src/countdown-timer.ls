Clock = require './clock'

class CountdownTimer
  (@_timeout, {@clock = new Clock} = {}) ->
    @_time-left = -1
    @clock.on-tick @~_tick

  start: ->
    @_time-left = @_timeout
    @clock.start!

  time-left: -> @_time-left

  is-running: -> @time-left! > 0

  _tick: ->
    @_time-left --
    @clock.stop! if @_time-left is 0


module.exports = CountdownTimer