global <<< require \prelude-ls

class TimeFormatter
  mm-ss: (seconds) ->
    minutes = Math.floor seconds / 60
    remaining-seconds = seconds % 60
    [minutes, remaining-seconds] = [minutes, remaining-seconds] |> map _ensure-min-two-digits
    "#minutes:#remaining-seconds"

  _ensure-min-two-digits = (number) ->
    number = "0#{number}" if number < 10
    "#{number}"

  @instance = ->
    @_instance ?= new TimeFormatter

module.exports = TimeFormatter