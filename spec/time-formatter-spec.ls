
time-formatter = require '../src/time-formatter' .instance!

works-for = it

describe \mm-ss ->
  works-for '00-00' ->
    expect time-formatter.mm-ss 0 .to-equal "00:00"

  works-for '00-59' ->
    expect time-formatter.mm-ss 59 .to-equal "00:59"

  works-for '01-40' ->
    expect time-formatter.mm-ss 1 * 60 + 40 .to-equal "01:40"

  works-for '100-02' ->
    expect time-formatter.mm-ss 100 * 60 + 2 .to-equal "100:02"

