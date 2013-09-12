var TimeFormatter;
import$(global, require('prelude-ls'));
TimeFormatter = (function(){
  TimeFormatter.displayName = 'TimeFormatter';
  var _ensureMinTwoDigits, prototype = TimeFormatter.prototype, constructor = TimeFormatter;
  prototype.mmSs = function(seconds){
    var minutes;
    minutes = Math.floor(seconds / 60);
    seconds = seconds % 60;
    return function(it){
      return it.minutes + ":" + it.seconds;
    }(
    Obj.map(_ensureMinTwoDigits)(
    {
      minutes: minutes,
      seconds: seconds
    }));
  };
  _ensureMinTwoDigits = function(number){
    if (number < 10) {
      number = "0" + number;
    }
    return number + "";
  };
  TimeFormatter.instance = function(){
    var ref$;
    return (ref$ = this._instance) != null
      ? ref$
      : this._instance = new TimeFormatter;
  };
  function TimeFormatter(){}
  return TimeFormatter;
}());
module.exports = TimeFormatter;
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}