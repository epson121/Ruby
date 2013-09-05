## Class method 
class A
	def self.talk
		p "Hi"
	end
end

A.talk

## anonymous, singleton class of every object can be changed
s = "I am a string."
# no 'twice' method
begin
	p s.twice()	
rescue Exception => e
	p e
end
# adding the method for 's' object only to anonymous, singleton class
class << s
	def twice
		self + " " + self
	end
end
p s.twice()

## Proc objects
pr = Proc.new {p "I am a proc!"}
pr.call()

p = Proc.new {|c| p c.upcase}
["alan", "steve"].each(&p) 
# => ALAN 
# => STEVE
def block_to_proc(&p)
	p.call
end
block_to_proc {p "Call block like a proc"}

string = "A sample string"
p string.instance_exec("s") {|delim| self.split(delim) }

## Threads

t = Thread.new do 
	p "starting the thread"
	sleep(1)
	p "ending the thread"
end
p "thread ended"
t.join()