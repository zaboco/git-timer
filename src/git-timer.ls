# global <<< require \prelude-ls

class GitTimer
  ->
    @_running = false

  start: ->
    @_running = true

  is-running: ->
    @_running

module.exports = GitTimer
