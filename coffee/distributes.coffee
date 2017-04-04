###
---------------------------------
 数据分布函数实现，包括 
 二元分布、二项分布、泊松分布
 正态分布、指数分布
 线性分布、随机分布
---------------------------------
说明：连续分布中没有做具体的拆解，
不如首部之前的部分和尾部之后的部
分未删除
---------------------------------
###
MathUtil = require "./utils/math_util"

[exp,pow,floor,ceil] = [Math.exp,Math.pow,Math.floor,Math.ceil]

# 二元分布
# P(X=1) = p;
# P(X=0) = q;
# 实现 
binaryDis = (n=2,p = 0.33333)->
    if p<0 || p>1 then throw new RangeError "平均分布p在0~1之间" else [p,1]

# 二项分布
# P(X=k) = Pn(k) = C(n,k)p(k)q(n-k)
binomialDis = (n,p = 0.5)->
	product = MathUtil.product
	total = 0
	for k in [0...n]
		total+=(product n) / (product k) / (product n - k) * p**k * (1-p)**(n-k)

# 泊松分布
poissonDis = (n,lamda=2)->
	product = MathUtil.product
	total = 0
	for k in [0...n]
		total += lamda ** k * (exp -lamda) / product k

# 正态分布 连续分布
normalDis = (n,mju=0,deta=1.0)->
	PI = Math.PI
	total = 0
	low = floor mju
	high = floor n + mju - 1
	for k in [0...n]
		total += 1/(pow 2 * PI * (pow deta,2) ,0.5) * exp -(pow k-mju,2)/2 /pow deta,2


# ---------------
# beta分布涉及到积分，暂不支持
# ---------------

# 指数分布 连续分布
exponentDis = (n,lamda=0.5)->
	total = 0
	for k in [0...n]
		total += lamda * exp (-lamda * k)

# 线性分布
linearDis = (n,rate=1)->
	total = 0
	for k in [1..n]
		total += k

# 随机分布
randomDis = (n)->
	total = 0
	arr = (Array n).fill 1
	for k in arr
		total += k


module.exports = {
	binaryDis
	binomialDis
	poissonDis
	normalDis
	exponentDis
	linearDis
	randomDis
}
