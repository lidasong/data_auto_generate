{
  first
  last
  length
  random
} = require "../utils/util"

# Enum 构造枚举类型

class Enum 
  constructor:(args)->
    if not (@ instanceof Enum)
      return new Enum args
    args = @valuesInObj args if Object.prototype.toString.call args is '[object Object]'
    @_enums = args
    @_length = length @_enums
  valuesInObj: (object) -> 
    val for key,val of object
  get:(ind)->
    @_enums[ind]
  index:(val)->
    @_enums.indexOf val
  set:(val,ind)->
    @_enums.splice ind ?= @_length,0,val

module.exports = Enum
