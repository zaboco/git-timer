require! Timer: '../src/timer'

that = it

var timer

describe \Timer ->
  describe \on-tick ->
    timer := new Timer
    before-each ->
      jasmine.Clock.useMock!

    that 'it is initially stopped' ->
      expect timer.is-running! .to-be-falsy!

    that 'it starts' ->
      timer.start!
      expect timer.is-running! .to-be-truthy!

    that 'it ticks after interval' ->
      ticked = false
      timer.on-tick -> ticked := true
      timer.start!
      jasmine.Clock.tick timer.interval! + 1
      expect ticked .to-be-truthy!

    # that 'it stops' ->
    #   timer.start!
