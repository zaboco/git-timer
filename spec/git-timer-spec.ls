require! GitTimer: '../src/git-timer'

that = it

git-timer = new GitTimer


describe \GitTimer ->
  describe \on-tick ->
    before-each ->
      jasmine.Clock.useMock!

    that 'it starts' ->
      git-timer.start!
      expect git-timer.is-running! .to-be-truthy!

    that 'it ticks after interval' ->
      ticked = false
      git-timer.on-tick -> ticked := true
      git-timer.start!
      jasmine.Clock.tick git-timer.interval! + 1
