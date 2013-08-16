##
# Calculates a fixed rate mortgage value
# * params r - interest rate (percentage)
# * params n - number of years a loan is taken
# * params po - borrowed amount
# * return c - monthly payment
# Usage:
#  *puts "Monthly payment is " + "%.3f" % frm(6.5, 30, 200000).to_s + " currency"*
def frm(r, n, po)
	## 
	# interest rate is converted to fraction and made a monthly
	r = r.to_f/100/12
	##
	#number of years is converted to number of months
	n = n * 12
	##
	#monthly payment is calculated
	c = (r / (1 - (1+r) ** -n) ) * po
	return c
end
