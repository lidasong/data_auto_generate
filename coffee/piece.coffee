###
使用分布函数与数据集
生成随机的数据值
###

{
	first
	last
	length
	random
	randomInt
	isFunction
} = require "./utils/util"

{
	binaryDis
	binomialDis
	poissonDis
	normalDis
	exponentDis
	linearDis
	randomDis
} = require "./distributes"


getItem = (field,spreadFunc,paras=[])->
	data = field.data
	if isFunction data
		return -> data() 
	n = length data
	paras.unshift n
	randomTotal = spreadFunc.apply null,paras
	maxRandom = last randomTotal
	->
		piece = random maxRandom
		for val,ind in randomTotal
			if val >= piece
				return data[ind]

genBinaryDis = (field,amount=1)->
	results = []
	p = field.options?.p
	genItem = if p then getItem field,binaryDis,[p] else getItem field,binaryDis
	genItem()
	###
	-----------------------------------------------
		这个是重复数据生成器，数据生成放在外面
	-----------------------------------------------
	###
	# do ->
	# 	while amount--
	# 		results.push genItem()
	# 	return results

genLinearDis = (field,amount=1)->
	results = []
	genItemgenItem = getItem field,linearDis
	genItemgenItem()

genBinomialDis = (field,amount=1)->
	p = field.options?.p
	results = []
	genItemgenItem = if p then getItem field,binomialDis,[p] else getItem field,binomialDis
	genItemgenItem()

genPoissonDis = (field,amount=1)->
	lamda = field.options?.lamda
	results = []
	genItem = if lamda then getItem field,binomialDis,[lamda] else getItem field,binomialDis
	genItem()

genNormalDis = (field,amount=1)->
	mju = field.options?.mju
	deta = field.options?.deta
	results = []
	genItem = getItem field,normalDis,[mju,deta].filter (val)->
		val isnt undefined
	genItem()

genExponentDis = (field,amount=1)->
	lamda = field.options?.lamda
	results = []
	genItem = if lamda then getItem field,exponentDis,[lamda] else getItem field,exponentDis
	genItem()

genRandomDis = (field,amount=1)->
	genItem = getItem field,randomDis
	genItem()


module.exports = {
	genBinaryDis
	genLinearDis
	genBinomialDis
	genPoissonDis
	genNormalDis
	genExponentDis
	genRandomDis
}