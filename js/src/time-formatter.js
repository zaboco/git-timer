var TimeFormatter;
import$(global, require('prelude-ls'));
TimeFormatter = (function(){
  TimeFormatter.displayName = 'TimeFormatter';
  var _ensureMinTwoDigits, prototype = TimeFormatter.prototype, constructor = TimeFormatter;
  prototype.mmSs = function(seconds){
    var minutes, remainingSeconds, ref$;
    minutes = Math.floor(seconds / 60);
    remainingSeconds = seconds % 60;
    ref$ = map(_ensureMinTwoDigits)(
    [minutes, remainingSeconds]), minutes = ref$[0], remainingSeconds = ref$[1];
    return minutes + ":" + remainingSeconds;
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