def permutate(string)
	letters = string.split("")
	get_permutations(letters, [])
end

def get_permutations(letters, result, pointer=0)
	if pointer == letters.size
		result << letters
		return
	end
	for i in pointer..letters.size - 1
		new_list = letters.clone
		new_list[pointer] = letters[i]
		new_list[i] = letters[pointer]
		get_permutations(new_list, result, pointer+1)
	end
	result
end

permutate("ABC").each do |permutation|
	p permutation
end