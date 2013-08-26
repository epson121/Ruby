##
# Standard implementation of fibonacci sequence generation
def fibo_n n
	return n if (0..1).include? n
	fibo_n(n-2) + fibo_n(n-1)
end

#p fibo_n 4
#p fibo_n 10
#p fibo_n 20
#p fibo_n 30
#p fibo_n 40

##
# Memoizable implementation +fibo_memoized+ saves values in array for later use
@series = [0, 1]
def fibo_memoized(n)
	@series[n] ||= fibo_memoized(n - 1) + fibo_memoized(n - 2)
end

# max value before stack level goes too deep
p fibo_memoized(30)
p fibo_memoized(2000)

require "benchmark"

N = 100

##
# benchmarking two different implementations of
# +fibonacci+ 
Benchmark.bmbm do |x|
	x.report("fibo_n") do
		N.times {
			fibo_n(20)
		}
	end

	x.report("fibo_memoized") do
		N.times{
			fibo_memoized(20)
		}
	end
end

#Rehearsal -------------------------------------------------
#fibo_n          0.750000   0.000000   0.750000 (  0.747623)
#fibo_memoized   0.000000   0.000000   0.000000 (  0.000084)
#---------------------------------------- total: 0.750000sec
#
#                    user     system      total        real
#fibo_n          0.740000   0.000000   0.740000 (  0.743264)
#fibo_memoized   0.000000   0.000000   0.000000 (  0.000034)



