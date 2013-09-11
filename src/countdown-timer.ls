Clock = require './clock'
require! 'events'.EventEmitter

class CountdownTimer extends EventEmitter
  (@_timeout, {@_clock = new Clock} = {}) ->
    @_time-left = -1
    @_clock.on \tick @~_tick
    @_timeout = Math.floor @_timeout

  start: ({in: delay} = {})->
    if delay?
      clear-timeout @_scheduled if @_scheduled?
      return @_scheduled = set-timeout @~start, delay * 1000ms
    @_time-left = @_timeout
    @emit \started
    @emit \each-second, @_time-left
    @_clock.start!

  stop: ->
    @emit \stopped, at: @_time-left
    @_clock.stop!

  restart: ({in: delay} = {})->
    @stop!
    @start in: delay

  time-left: -> @_time-left

  is-running: -> @time-left! > 0

  _tick: ->
    @_time-left --
    @emit \each-second, @_time-left
    @_on-timeout! if @_time-left is 0

  _on-timeout: ->
    @emit \timeout
    @_clock.stop!

module.exports = CountdownTimer