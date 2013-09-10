require! {
  CountdownTimer: './countdown-timer'
  time-formatter: './time-formatter'.instance!
  clc: 'cli-color'
  'child_process'.exec
}

TIMEOUT = 5sec

timer = new CountdownTimer TIMEOUT

reset-git = ->
  reset = exec 'git reset --hard' -> log ' Your time is up, all changes are reset! Try again...'
  reset.stdin.end!

log = (output) -> process.stdout.write output

clear-output = ->
  log "#{clc.down 1}#{clc.bol -1 true}"

timer.on \each-second (seconds-left)->
  clear-output!
  log time-formatter.mm-ss seconds-left

timer.on \timeout ->
  reset-git!
  timer.start in: 2

timer.start!
