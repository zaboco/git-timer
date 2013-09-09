require! Clock: '../src/clock'

DELAY = 100

that = it

var clock

describe \Clock ->
  describe \on-tick ->
    before-each ->
      clock := new Clock DELAY
      jasmine.Clock.useMock!

    that 'it is initially stopped' ->
      expect clock.is-running! .to-be-falsy!

    that 'it starts' ->
      clock.start!
      expect clock.is-running! .to-be-truthy!

    that 'it ticks after interval' ->
      ticked = false
      clock.on-tick -> ticked := true
      clock.start!
      jasmine.Clock.tick DELAY + 1
      expect ticked .to-be-truthy!

    that 'it stops' ->
      clock.start!
      clock.stop!
      expect clock.is-running! .to-be-falsy!
