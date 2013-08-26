##
# Pig latin -> english word game
# http://en.wikipedia.org/wiki/Pig_Latin
def pig_latin(str)
	vow = ["a", "e", "i", "o", "u"]
	a = str.downcase.chars.first
	return str + "way" if vow.include? a
	a = ""
	str.split("").each {|c| if !vow.include? c; a += c; else; break;end }
	return str.sub(a, "") + a + "ay"
end

# Examples
p pig_latin("egg")
p pig_latin("inbox")
p pig_latin("eight")

p pig_latin("happy")
p pig_latin("duck")
p pig_latin("glove")
p pig_latin("yellow")

