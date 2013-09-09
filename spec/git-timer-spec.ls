require! GitTimer: '../src/git-timer'

that = it

git-timer = new GitTimer

describe \GitTimer ->
  describe \on-tick ->
    that 'it starts' ->
      git-timer.start!
      expect git-timer.is-running! .to-be-truthy!

      # ticked = false
      # git-timer.on-tick -> ticked := true
      # jasmine