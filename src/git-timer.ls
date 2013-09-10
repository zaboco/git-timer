require! {
  CountdownTimer: './countdown-timer'
  time-formatter: './time-formatter'.instance!
  clc: 'cli-color'
  'child_process'.spawn
}

TIMEOUT = 2sec

timer = new CountdownTimer TIMEOUT

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

timer.start!
