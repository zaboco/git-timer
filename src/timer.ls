global <<< require \prelude-ls

class Timer
  ->
    @_running = false
    @_actions = []
    @_delay = 100

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

module.exports = Timer
