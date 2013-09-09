CountdownTimer = require '../src/countdown-timer'

TIMEOUT = 1min * 60sec

that = it
var countdown-timer, mock-clock

describe \CountdownTimer ->
  before-each ->
    mock-clock :=
      start: ->
      stop: ->
      onTick: ->

    spy-on mock-clock, \onTick .and-call-fake (action) ->
      mock-clock.action = action

    spy-on mock-clock, \start .and-call-fake ->
      for til TIMEOUT then mock-clock.action!

    spy-on mock-clock, \stop

    countdown-timer := new CountdownTimer do
      TIMEOUT
      clock: mock-clock

  describe \initially ->
    that 'is not running' ->
      expect countdown-timer.is-running! .to-be-falsy!

  describe 'after start' ->
    before-each ->
      countdown-timer.start!

    that 'is running' ->
      expect countdown-timer.is-running! .to-be-truthy!

    that 'clock is started' ->
      expect mock-clock.start .to-have-been-called!

    that 'time-left is the initial timeout' ->
      expect countdown-timer.time-left! .to-equal TIMEOUT
