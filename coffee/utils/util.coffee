isLoseParas = ->
	if not arguments.length
		throw ReferenceError "缺少参数"

first = (arrLike)->
	arrLike[0]
last = (arrLike)->
	arrLike[arrLike.length-1]
length = (arrLike)->
	arrLike.length
random = (max,min=0)->
    min + Math.random() * (max - min)
randomInt = (max,min=0)->
    return min + Math.floor(Math.random() * (max - min));
zip = (keys,vals)->
	results={}
	for key,ind in keys 
		results[key] = vals[ind]
	results
keys = (obj)->
	Object.keys obj
values = (obj)->
	mapKey = keys obj
	obj[key] for key in mapKey 
find = (obj,key)->
	key in keys obj
basicType = (variable)->
	typeof variable in ['string', 'number', 'boolean', 'undefined']
isFunction = (variable)->
	typeof variable is 'function'

module.exports = {
	isLoseParas
	first
	last
	length
	random
	randomInt
	zip
	keys
	values
	find
	basicType
	isFunction
}