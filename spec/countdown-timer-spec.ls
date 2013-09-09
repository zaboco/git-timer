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

  describe 'at timeout' ->
    before-each ->
      countdown-timer.start!
      jasmine.Clock.tick TIMEOUT * 1000

    that 'it is not running' ->
      expect countdown-timer.is-running! .to-be-falsy!

    that 'time left is 0' ->
      expect countdown-timer.time-left! .to-equal 0
