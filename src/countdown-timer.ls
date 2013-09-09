class CountdownTimer
  (timeout, {@clock} = {}) ->
    @_time-left = timeout

  time-left: -> @_time-left


module.exports = CountdownTimer