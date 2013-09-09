class CountdownTimer
  (timeout, {@clock} = {}) ->
    @_time-left = timeout

  time-left: -> @_time-left

  is-running: -> @time-left! > 0


module.exports = CountdownTimer