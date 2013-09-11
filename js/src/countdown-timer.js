var Clock, EventEmitter, CountdownTimer;
Clock = require('./clock');
EventEmitter = require('events').EventEmitter;
CountdownTimer = (function(superclass){
  var prototype = extend$((import$(CountdownTimer, superclass).displayName = 'CountdownTimer', CountdownTimer), superclass).prototype, constructor = CountdownTimer;
  function CountdownTimer(_timeout, arg$){
    var ref$;
    this._timeout = _timeout;
    this._clock = (ref$ = (arg$ != null
      ? arg$
      : {})._clock) != null
      ? ref$
      : new Clock;
    this._timeLeft = -1;
    this._clock.on('tick', bind$(this, '_tick'));
  }
  prototype.start = function(arg$){
    var delay;
    delay = (arg$ != null
      ? arg$
      : {})['in'];
    if (delay != null) {
      if (this._scheduled != null) {
        clearTimeout(this._scheduled);
      }
      return this._scheduled = setTimeout(bind$(this, 'start'), delay * 1000);
    }
    this._timeLeft = this._timeout;
    this.emit('started');
    this.emit('each-second', this._timeLeft);
    return this._clock.start();
  };
  prototype.stop = function(){
    this.emit('stopped', {
      at: this._timeLeft
    });
    return this._clock.stop();
  };
  prototype.restart = function(arg$){
    var delay;
    delay = (arg$ != null
      ? arg$
      : {})['in'];
    this.stop();
    return this.start({
      'in': delay
    });
  };
  prototype.timeLeft = function(){
    return this._timeLeft;
  };
  prototype.isRunning = function(){
    return this.timeLeft() > 0;
  };
  prototype._tick = function(){
    this._timeLeft--;
    this.emit('each-second', this._timeLeft);
    if (this._timeLeft === 0) {
      return this._onTimeout();
    }
  };
  prototype._onTimeout = function(){
    this.emit('timeout');
    return this._clock.stop();
  };
  return CountdownTimer;
}(EventEmitter));
module.exports = CountdownTimer;
function extend$(sub, sup){
  function fun(){} fun.prototype = (sub.superclass = sup).prototype;
  (sub.prototype = new fun).constructor = sub;
  if (typeof sup.extended == 'function') sup.extended(sub);
  return sub;
}
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}
function bind$(obj, key, target){
  return function(){ return (target || obj)[key].apply(obj, arguments) };
}