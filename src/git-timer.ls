require! {
  CountdownTimer: './countdown-timer'
  time-formatter: './time-formatter'.instance!
  clc: 'cli-color'
}

TIMEOUT = 4sec

timer = new CountdownTimer TIMEOUT

clear-output = ->
  process.stdout.write clc.bol 0

timer.on \each-second (seconds-left)->
  clear-output!
  process.stdout.write time-formatter.mm-ss seconds-left

timer.on \timeout ->
  console.log \done
  process.exit 0

timer.start!
