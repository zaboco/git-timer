global <<< require \prelude-ls

class TimeFormatter
  mm-ss: (seconds) ->
    minutes = Math.floor seconds / 60
    seconds = seconds % 60
    {minutes, seconds} |> Obj.map _ensure-min-two-digits |> -> "#{it.minutes}:#{it.seconds}"

  _ensure-min-two-digits = (number) ->
    number = "0#{number}" if number < 10
    "#{number}"

  @instance = ->
    @_instance ?= new TimeFormatter

module.exports = TimeFormatter