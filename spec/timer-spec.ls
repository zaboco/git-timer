require! Timer: '../src/timer'

that = it

timer = new Timer


describe \Timer ->
  describe \on-tick ->
    before-each ->
      jasmine.Clock.useMock!

    that 'it starts' ->
      timer.start!
      expect timer.is-running! .to-be-truthy!

    that 'it ticks after interval' ->
      ticked = false
      timer.on-tick -> ticked := true
      timer.start!
      jasmine.Clock.tick timer.interval! + 1
      expect ticked .to-be-truthy!
