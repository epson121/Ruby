##
# Program that generates first +n+ prime numbers
# 	#Usage:
# 	p primes(10)
# 	p primes(20) 
#
def primes(n)
	counter = 0
	primes = []
	start = 2
	while counter < n do
		prime = true
		(2..start - 1).each do |v|
			if start % v == 0
				prime = false
			end
		end
		if prime == true
			counter += 1
			primes << start
			prime = false
		end
		start += 1
	end
	return primes
end