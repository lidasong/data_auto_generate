{
  first
  last
  length
  random
} = require "../utils/util"

# Order 构造枚举类型

class Order 
  constructor:(start = 1,prefix,suffix)->
    if not (@ instanceof Order)
      return new Order start,prefix,suffix
    @start = start
    @prefix = prefix
    @suffix = suffix
  next: ->
    id = @prefix + @start if @prefix
    id += @start + @suffix if @suffix
    @start++
    id

module.exports = Order