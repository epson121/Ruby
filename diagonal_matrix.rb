=begin
Given a 2D  regular (n x n) matrix, print all elements of the given matrix in diagonal order. For example, consider the following 5 X 4 input matrix.

    [1, 2, 3],
    [4, 5, 6], 
    [7, 8, 9]
Diagonal printing of the above matrix is

    1	
	2	4	
	3	5	7	
	6	8	
	9	
=end

class DiagonalMatrixPrint

	def get_matrix m
		matrix = m
		print_diagonally matrix
	end

	def print_diagonally matrix
		sum = 0
		while sum <= ((matrix.length-1) ** 2)
			0.upto(matrix.length - 1) do |i|
				0.upto(matrix.length - 1) do |j|
					if (i + j == sum)
						print matrix[i][j].to_s + "\t"
					end
				end
			end
			print "\n"
			sum += 1;
		end
	end

end

m = DiagonalMatrixPrint.new
m.get_matrix([[1, 2, 3],[4, 5, 6], [7, 8, 9]])
m.get_matrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])
m.get_matrix([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]])