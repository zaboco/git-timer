global <<< require \prelude-ls

class Clock
  ->
    @_running = false
    @_actions = []
    @_delay = 1000

  start: ->
    @_running = true
    @_interval = set-interval @~do-actions, @delay!

  stop: ->
    @_running = false
    clear-interval @_interval

  is-running: ->
    @_running

  on-tick: (action) ->
    @_actions.push action

  do-actions: ->
    @_actions |> each (.call!)

  delay: -> @_delay

module.exports = Clock
