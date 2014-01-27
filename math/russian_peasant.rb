# Russian peasant implementation
# multiplication of numbers without using * and / 

def russian_peasant(a, b)
	res = 0
	while b > 0
		if b & 1 == 1
			res += a
		end
		a = a << 1
		b = b >> 1
	end
	res
end


p russian_peasant(11, 10)
p russian_peasant(18, 1)
p russian_peasant(20, 12)