##
# Linear search for value in array
# given an array +a+ and value +v+ program scans array searching for value +v+
# if +v+ is founc, *index* of +v+ in +a+ is retured, else *nil* is returned
# example:
# 	p linear_search([1, 2, 3, 4, 5], 4) => 3
# 	p linear_search([1, 2, 3, 4, 5], 12) => nil
def linear_search(a, v)
	a.each_with_index do |e, i|
		if e == v
			return i
		end
	end
	nil
end


##
# Solved using ruby built-in method
# example:
# 	p linear_search_simple([1, 2, 3, 4, 5], 4) => 3
# 	p linear_search_simple([1, 2, 3, 4, 5], 12) => nil
def linear_search_simple(a, v)
	a.find_index(v)
end