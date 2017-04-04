# 斐波那契
factorial = (n) ->
    if n < 0 then throw new RangeError "计算斐波那契n不能为负数" else _factor n

_factor = (n)->
  if n == 0  then 1 else _factor n-1 * _factor n - 2

# 阶乘定义
product = (n)->
    if n < 0 then throw new RangeError "计算阶乘n不能为负数" else _product n

_product = (n)->
	if n==0 then 1 else n * _product n-1

module.exports = {
	factorial
	product
}