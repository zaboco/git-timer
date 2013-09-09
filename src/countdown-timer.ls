Clock = require './clock'

class CountdownTimer
  (@_timeout, {@clock = new Clock} = {}) ->
    @_time-left = -1
    @clock.on-tick -> @~_tick

  start: -> @_time-left = @_timeout

  time-left: -> @_time-left

  is-running: -> @time-left! > 0

  _tick: ->
    @_time-left --


module.exports = CountdownTimer