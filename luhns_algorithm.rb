##
# Luhns algorithm for credit cart number validation
# somewhat obfuscated solution, but i wanted it that way
# if in trouble, check out the algorithm at http://www.freeformatter.com/credit-card-number-generator-validator.html
# or wikipedia for +luhns algorithm+
# examples:
#
# 	p luhns(30171300450544) => true
# 	p luhns(378282246310005) => true
# 	p luhns(5555555555554444) => true
# 	p luhns(123123132132) => false
#

def luhns(a)
	b = a.to_s[0..-2].reverse.split("").to_a.map{|v|v.to_i}
	(b.each_index{|i|i.even? ? b[i]=b[i]*2>9?b[i]*2-9:b[i]*2:i=i}.inject(:+)+a)%10==0
end



