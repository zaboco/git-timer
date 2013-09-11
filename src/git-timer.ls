require! {
  CountdownTimer: './countdown-timer'
  time-formatter: './time-formatter'.instance!
  clc: \cli-color
  eog: \eye-of-git
  \child_process .spawn
  \commander
}

DEFAULT_MINUTES = 5min

commander
  .version '0.0.1'
  .option '-m, --minutes [min]', 'Specify timeout in minutes (default is 5)'
  .parse process.argv

timer = new CountdownTimer (commander.minutes ? DEFAULT_MINUTES) * 60sec
git-watcher = eog '.', <[ master ]>
var color-filter


reset-git = ->
  reset = spawn 'git', ['reset' '--hard']
  reset.stdin.end!

log = (output) -> process.stdout.write output

clear-output = ->
  log "\n#{clc.bol -1 true}"

timer.on \started ->
  color-filter := clc.green-bright

timer.on \each-second (seconds-left)->
  clear-output!
  color-filter := clc.red-bright if seconds-left < 15
  log color-filter time-formatter.mm-ss seconds-left

timer.on \timeout ->
  reset-git!
  log "#{clc.bol 0 true}#{clc.bg-red ' Your time is up, all changes are reset! Try again...'}"
  timer.start in: 2

git-watcher.on \commit ->
  return if not timer.is-running!
  log "#{clc.bol 0 true}#{clc.bg-green ' Great, you commited! You can move on...'}"
  timer.restart in: 2

timer.start!
