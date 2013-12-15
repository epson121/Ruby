# Binets formula for nth fibonacci number

PHI = 1.6180339887498948482


# Formula is (Phi^n - (-1/Phi)^n) / sqrt(5)
def fib(n)
	((PHI ** n - (-1/PHI) ** n) / Math.sqrt(5)).round
end



p fib(1)
p fib(2)
p fib(3)
p fib(4)
p fib(5)
p fib(6)
p fib(7)
p fib(8)
p fib(9)
p fib(10)
p fib(11)
p fib(12)