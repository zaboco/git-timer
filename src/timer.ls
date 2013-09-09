global <<< require \prelude-ls

class Timer
  ->
    @_running = false
    @_actions = []
    @_interval = 1000

  start: ->
    @_running = true
    set-interval @~do-actions, @interval!

  is-running: ->
    @_running

  on-tick: (action) ->
    @_actions.push action

  do-actions: ->
    @_actions |> each (.call!)

  interval: -> @_interval

module.exports = Timer
