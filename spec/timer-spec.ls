require! Timer: '../src/timer'

that = it

var timer

describe \Timer ->
  describe \on-tick ->
    before-each ->
      timer := new Timer
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
      jasmine.Clock.tick timer.delay! + 1
      expect ticked .to-be-truthy!

    that 'it stops' ->
      timer.start!
      timer.stop!
      expect timer.is-running! .to-be-falsy!
