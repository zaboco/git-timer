CountdownTimer = require '../src/countdown-timer'

TIMEOUT = 1min * 60sec

that = it
var countdown-timer

describe \CountdownTimer ->
  before-each -> countdown-timer := new CountdownTimer do
    TIMEOUT
    clock: 1

  describe \initially ->
    that 'time-left is the initial timeout' ->
      expect countdown-timer.time-left! .to-equal TIMEOUT

    that 'is running' ->
      expect countdown-timer.is-running! .to-be-truthy!
