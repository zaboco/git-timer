Clock = require './clock'

class CountdownTimer
  (@_timeout, {@_clock = new Clock} = {}) ->
    @_time-left = -1
    @_clock.on-tick @~_tick

  start: ->
    @_time-left = @_timeout
    @_clock.start!

  time-left: -> @_time-left

  is-running: -> @time-left! > 0

  on-each-second: (action) ->
    @_each-second-action = action

  _tick: ->
    @_time-left --
    @_each-second-action @_time-left if @_each-second-action?
    @_clock.stop! if @_time-left is 0


module.exports = CountdownTimer