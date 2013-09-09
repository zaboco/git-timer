CountdownTimer = require '../src/countdown-timer'

TIMEOUT = 1min * 60sec

that = it
var countdown-timer, mock-clock

describe \CountdownTimer ->
  before-each ->
    jasmine.Clock.useMock!
    countdown-timer := new CountdownTimer do
      TIMEOUT

  describe \initially ->
    that 'is not running' ->
      expect countdown-timer.is-running! .to-be-falsy!

  describe 'after start' ->
    before-each ->
      countdown-timer.start!

    that 'is running' ->
      expect countdown-timer.is-running! .to-be-truthy!

    that 'time-left is the initial timeout' ->
      expect countdown-timer.time-left! .to-equal TIMEOUT

  describe 'after a second' ->
    that 'is calling the action' ->
      var seconds-left
      countdown-timer.on \each-second, (sec) -> seconds-left := sec
      countdown-timer.start!
      jasmine.Clock.tick 1s * 1000ms + 1ms
      expect seconds-left .to-equal TIMEOUT - 1

  describe 'at timeout' ->
    done = false
    before-each ->
      countdown-timer.on \timeout, -> done := true
      countdown-timer.start!
      jasmine.Clock.tick TIMEOUT * 1000ms

    that 'it is not running' ->
      expect countdown-timer.is-running! .to-be-falsy!

    that 'time left is 0' ->
      expect countdown-timer.time-left! .to-equal 0

    that 'it emits a timeout signal' ->
      expect done .to-be-truthy!
