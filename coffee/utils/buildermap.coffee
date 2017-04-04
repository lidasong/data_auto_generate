{
	zip
} = require "./util"

{
	genBinaryDis
	genLinearDis
	genBinomialDis
	genPoissonDis
	genNormalDis
	genExponentDis
	genRandomDis
} = require "../piece"

module.exports = 
	zip [
		'binary' ,'random','linear','binomial','poisson','normal','exponent'
		],[
			genBinaryDis ,genRandomDis,genLinearDis,genBinomialDis,genPoissonDis,genNormalDis,genExponentDis
		] 

