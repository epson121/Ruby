require 'in_place_permutation'
require 'linear_search'

## 
# Uses linear search and permutation to find value in array
# p scramble_search([1, 2, 3, 5, 4], 4)
# p scramble_search([1, 2, 3, 5, 4], 6)
#
def scramble_search(array, v)
	linear_search(permute(array), v) != nil ? true : false
end