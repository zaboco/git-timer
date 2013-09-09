CountdownTimer = require '../src/countdown-timer'

TIMEOUT = 1min * 60sec

that = it
var countdown-timer

describe \CountdownTimer ->
  before-each -> countdown-timer := new CountdownTimer do
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
