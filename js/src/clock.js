var EventEmitter, Clock;
import$(global, require('prelude-ls'));
EventEmitter = require('events').EventEmitter;
Clock = (function(superclass){
  var prototype = extend$((import$(Clock, superclass).displayName = 'Clock', Clock), superclass).prototype, constructor = Clock;
  function Clock(_delay){
    this._delay = _delay != null ? _delay : 1000;
    this._running = false;
    this._actions = [];
  }
  prototype.start = function(){
    this._running = true;
    return this._interval = setInterval(bind$(this, '_tick'), this._delay);
  };
  prototype.stop = function(){
    this._running = false;
    return clearInterval(this._interval);
  };
  prototype.isRunning = function(){
    return this._running;
  };
  prototype._tick = function(){
    return this.emit('tick');
  };
  return Clock;
}(EventEmitter));
module.exports = Clock;
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}
function extend$(sub, sup){
  function fun(){} fun.prototype = (sub.superclass = sup).prototype;
  (sub.prototype = new fun).constructor = sub;
  if (typeof sup.extended == 'function') sup.extended(sub);
  return sub;
}
function bind$(obj, key, target){
  return function(){ return (target || obj)[key].apply(obj, arguments) };
}