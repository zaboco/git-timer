var CountdownTimer, timeFormatter, clc, eog, spawn, commander, fs, DEFAULT_MINUTES, timer, ref$, gitWatcher, colorFilter, resetGit, log, clearOutput, hookExists, hooksDir, cp;
CountdownTimer = require('./countdown-timer');
timeFormatter = require('./time-formatter').instance();
clc = require('cli-color');
eog = require('eye-of-git');
spawn = require('child_process').spawn;
commander = require('commander');
fs = require('fs');
DEFAULT_MINUTES = 5;
commander.version('0.0.1').option('-m, --minutes [min]', 'Specify timeout in minutes (default is 5)').option('-g, --green', 'Allow only commits on green.\n  \t\t\t (!) node only - requires `npm test` to be defined.\n  \t\t\t (!) WARNING: adds a pre-commit hook to git').parse(process.argv);
timer = new CountdownTimer(((ref$ = commander.minutes) != null ? ref$ : DEFAULT_MINUTES) * 60);
gitWatcher = eog('.', ['master']);
resetGit = function(){
  var reset;
  reset = spawn('git', ['reset', '--hard']);
  return reset.stdin.end();
};
log = function(output){
  return process.stdout.write(output);
};
clearOutput = function(){
  return log("\n" + clc.bol(-1, true));
};
if (commander.green) {
  hookExists = fs.existsSync('.git/hooks/pre-commit');
  if (hookExists) {
    log(clc.cyan('(i) pre-commit hook already exists, doing nothing\n'));
  } else {
    hooksDir = __dirname + "/../../.hooks";
    cp = spawn('cp', [hooksDir + "/pre-commit", './.git/hooks/pre-commit']);
    cp.stdin.end();
    log(clc.yellow('(!) no pre-commit hook, added one.\n'));
  }
}
timer.on('started', function(){
  return colorFilter = clc.greenBright;
});
timer.on('each-second', function(secondsLeft){
  clearOutput();
  if (secondsLeft < 15) {
    colorFilter = clc.redBright;
  }
  return log(colorFilter(timeFormatter.mmSs(secondsLeft)));
});
timer.on('timeout', function(){
  resetGit();
  log(clc.bol(0, true) + "" + clc.bgRed(' Your time is up, all changes are reset! Try again...'));
  return timer.start({
    'in': 2
  });
});
gitWatcher.on('commit', function(){
  if (!timer.isRunning()) {
    return;
  }
  log(clc.bol(0, true) + "" + clc.bgGreen(' Great, you\'ve commited! You can move on...'));
  return timer.restart({
    'in': 2
  });
});
timer.start();