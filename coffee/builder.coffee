###
-----------------------------------
单条数据生成器，根据配置文件
每个字段按照自己的分布生成字段数据，
使用dataBuilder将各个字段聚合生成
完整的一条数据集
-----------------------------------
###

{
	first
	last
	length
	random
	randomInt
	zip
	find
} = require "./utils/util"

###
	数据生成器选择关系对照
{
	binary => genBinaryDis 
	random => genRandomDis
	linear => genLinear
	binomial => genBinomialDis
	poisson => genPoissonDis
	normal => genNormaDis
	exponent => genExponentDis
}
###

buildermap = require './utils/buildermap'

# 单挑数据生成器
dataBuilder = (designer)->
	keys = Object.keys designer
	setKeeper = removeDepend designer
	->	
		result = {}
		genSequence = setKeeper result
		for key in keys
			genSequence key
		result

# config配置中递归父元素数据
removeDepend = (designer)->
	parents = []
	(result)->
		genSequence = (type)->
			segment =  designer[type]
			[spread,parent,field] = [segment.spread || 'random',segment.parent,segment.data]
			if not parent or result[parent]
				if not parent
					result[type] ?= buildermap[spread] segment 
				else 
					segment = getChildSegment segment.data,result[parent]
					[spread,parent,field] = [segment.spread || 'random',segment.parent,segment.data]
					result[type] ?= buildermap[spread] segment 

				genSequence parents.pop() if parents.length
			else 
				parents.push type
				genSequence parent

getChildSegment = (segment,parent)->
	for childSegment in segment
		return childSegment[parent] if find childSegment,parent

module.exports = dataBuilder

