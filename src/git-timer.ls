require! {
  CountdownTimer: './countdown-timer'
  time-formatter: './time-formatter'.instance!
  clc: 'cli-color'
  eog: 'eye-of-git'
  'child_process'.spawn
}

TIMEOUT = 1min * 60sec

timer = new CountdownTimer TIMEOUT
git-watcher = eog '.', <[ master ]>

reset-git = ->
  reset = spawn 'git', ['reset' '--hard']
  reset.stdin.end!
  log ' Your time is up, all changes are reset! Try again...'

log = (output) -> process.stdout.write output

clear-output = ->
  log "#{clc.down 1}#{clc.bol -1 true}"

timer.on \each-second (seconds-left)->
  clear-output!
  log time-formatter.mm-ss seconds-left

timer.on \timeout ->
  reset-git!
  timer.start in: 2

git-watcher.on \commit ->
  log ' Great, you commited! You can move on...'
  timer.restart in: 2

timer.start!
