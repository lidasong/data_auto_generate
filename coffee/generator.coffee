###
-----------------------------------
文件生成器，批量生成数据，并将生成
的数据以一定的格式保存，目前支持
txt、json、csv基本的文件格式
-----------------------------------
###

fs = require "fs"
dataBuilder = require "./builder"

{
	values
	length
} = require './utils/util' 
generator = (opts)->
	{
		config
		form
		fileName
		size = 0
		extra={}
	} = opts

	builder = dataBuilder config

	results = while size--
		builder() 

	switch 
		when form in ['txt', 'json','text','csv','excel']
			makeFile results,form,fileName
		when form in ['mysql','oracle','db2','database']
			console.log form + 'not support now'
		else
			console.log 'not conform',form

# 这块待处理，加上用户自定义逻辑
# 用来处理results结果，比如对每条或
# 一条数据中的某项处理函数
generateCSV = (results)->
	results = for result in results
		(values result).join(',') + '\n' 
	results.join ''

generatorJSON = (results)->
	results = for result in results
		values result
	JSON.stringify results,null,2
	
generatorTXT = (results)->
	results = for result in results
		(values result).join(',') + '\n'
	results.join ''

makeFile = (results,form,fileName)->
	switch form
		when 'csv'
			generate = generateCSV
		when 'json'
			generate = generatorJSON
		else
			generate = generatorTXT

	fs.writeFile (fileName || + new Date()) + '.' + form
		,generate results

module.exports = generator