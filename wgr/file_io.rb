## Record separator for ruby is $/ variable
# it holds value \n but it can be changed at any time

## Reading and writing
f = File.new("sample.txt", "w")
f.puts("First line")
f.puts("Second line")
f.puts("Third line")
f.puts("Fourth line")
f.puts("Fifth line")
f.close()
f = File.new("sample.txt")
while !f.eof? do
	p f.gets()
end

## manipulating directories
d = Dir.new("scope")
p d.entries