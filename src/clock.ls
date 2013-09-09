global <<< require \prelude-ls
require! 'events'.EventEmitter

class Clock extends EventEmitter
  (@_delay = 1000)->
    @_running = false
    @_actions = []

  start: ->
    @_running = true
    @_interval = set-interval @~_tick, @_delay

  stop: ->
    @_running = false
    clear-interval @_interval

  is-running: ->
    @_running

  _tick: ->
    @emit \tick


module.exports = Clock
