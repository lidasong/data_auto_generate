[
  floor
  random
] = [
  Math.floor
  Math.random
]

class Time
  constructor:({year = 1970,dateFormat} = {})->
    if not (@ instanceof Time)
      return new Time {year,dateFormat}
    @year = year
    @dateFormat = dateFormat || @_nill
    @leapDay = if year % 4 == 0 then 29 else 28
  _nill : ({year,month,day})->
    new Date [year,month,day].join '-'

  createTime : ->
    month = [1..12][floor random() * 12]
    day = switch 
      when month in [1,3,5,7,8,10,12]
        [1..31][floor random() * 31] 
      when month in [4,6,9,11]
        [1..30][floor random() * 30]
      else
        [1..@leapDay][floor random() * @leapDay]
    @dateFormat {@year,month,day}

module.exports = Time


# 测试demo
if module.parent is null
  {
    genExponentDis
    genLinearDis
  } = require '../piece'

  format = ({year,month,day})-> 
    month = genLinearDis 
          data:[1,2,3,4,5,6,7,8,9,10,11,12]
    [year,month,day]
  time = new Time({
    year:2016,
    dateFormat:format
  })
  console.log time.createTime()