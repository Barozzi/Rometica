### S E E D S . R B  ########################################
	#
	# This file populates the game DB with Rometica tiles
##
### C R E A T E  T I L E S  #################################
	# The Arithmetic  based Tiles db gets:
	# 	1 key
	# 	2 components
	# 	6 decoys, or possible non-solution answers
	#
##

def make_sum?(num, game_array) 
	array_of_sums = []

	game_array.each do |i|
		array_of_sums << i + num
	end
	if (array_of_sums & game_array).length > 0
		return true
	else
		return false
	end
end

# Second of two checks
# Be sure that the new number is not the sum
# of two existing numbers
def a_sum?(num, game_array)
	array_of_sums = []
	array_of_sums << game_array[0]

	game_array.each_index do |i|
		game_array.each_index do |j|
			unless i == j
				array_of_sums << game_array[i] + game_array[j]
			end
		end
	end
	if ([num] & array_of_sums).length > 0
		return true
	else
		return false
	end
end

def duplication?(num, game_array)
	if ( (game_array & [num]).length > 0 )
		return true
	else
		return false
	end
end


def first_three()
	three_numbers = []
	three_numbers << (7..35).to_a.sample #rand(7..35)

	three_numbers << (1..(three_numbers[0] - 1)).to_a.sample #rand(1..(three_numbers[0] - 1))
	three_numbers << three_numbers[0] - three_numbers[1]
	return three_numbers
end


def create_tiles
	70.times do 

		game_array = first_three

		while(game_array.length < 9)
			num = (1..35).to_a.sample #rand(1..35)

			unless duplication?(num, game_array)
				unless make_sum?(num, game_array)
					unless a_sum?(num, game_array)
						game_array << num
					end
				end
			end
		end

		#   Mayor.create(name: 'Emanuel', city: cities.first)

		Tile.create(level: 5, t1: game_array[0],
					t2: game_array[1], t3: game_array[2],
					t4: game_array[3], t5: game_array[4],
					t6: game_array[5], t7: game_array[6],
					t8: game_array[7], t9: game_array[8])
	end
end

### C R E A T E  T I M E S  T A B L E  ##################################
	# Populates the database with times tables 2-9,
	# and generates randomly a set of numbers that serve as wrong answers
	# for the Rometica Tile grid.
	# * *Tables* :
	# 	Tiles - The Tiles table separated by level.
	# 	Level - The level for the times table grids is declaired as 10.
	# * *Variables* :
	# 	game_array - A nine integer array representing the Rometica grid.
	# * *Sub_Functions* :
	# 	add_wrong(9, game_array) - adds a random integer value 2-9
	# 	add_wrong(20, game_array) - adds a random integer value 2-20
	# 	add_wrong(81, game_array) - adds a random integer value 2-81
#
def create_times_table
	return_array = []
	game_array = []

	#2 * 2-9
	#3 * 3-9
	#4 * 4-9
	# etc ...

	(2..9).each do |i|
		(i..9).each do |j|
			game_array << i * j
			game_array << i 
			game_array << j
			2.times do 
				game_array << add_wrong(9, game_array)
			end
			2.times do
				game_array << add_wrong(20, game_array)
			end
			2.times do 
				game_array << add_wrong(81, game_array)
			end

			return_array << game_array
			game_array = []
		end
	end
	return_array.each do |game_array|
		Times.create(level: 10, t1: game_array[0],
			t2: game_array[1], t3: game_array[2],
			t4: game_array[3], t5: game_array[4],
			t6: game_array[5], t7: game_array[6],
			t8: game_array[7], t9: game_array[8])
	end
			
end


###  A D D  W R O N G  ###############################################
	# Generates a wrong answer to be inserted into the Rometica grid
	# based on the constraints enforced by the good_wrong? function.
	# * *ARGS* : 
	# 	high_bit - 	an integer value representing the uppermost range
	# 	of the number generated by this function.
	#
	# 	input_array - the existing array of selected integer values
	# * *Sub_Functions* :
	# 	good_wrong? - this validates the acceptability of the random number.
	# * *Returns* :
	# 	num - a random integer that passes constraints.
#
def add_wrong(high_bit, input_array)
	num = (2..high_bit).to_a.sample # rand(2..high_bit)
	until good_wrong?(num, input_array)
		num = (2..high_bit).to_a.sample #rand(2..high_bit)
	end
	return num
end


###  G O O D  W R O N G ?  #############################################
	# Enforces constraints on a random number.
	# It returns true if the number meets constraints, and false
	# otherwise.
	# * *ARGS* :
	# 	num - the integer value to be tested
	# 	input_array - the existing numbers to be tested against
	# * *Returns* :
	# 	TRUE - if num passes constraints
	# 	FALSE - if num fails to pass constraints
#
def good_wrong?(num, input_array)
	if (multiple?(num, input_array) || duplicate?(num, input_array))
		return false
	else
		return true
	end
end


###  M U L T I P L E ? ################################################
	# Checks an input number against a pair of constraints.
	# The first check multiplies the input value by each element in 
	# the input_array and compares the result against the values in
	# the input_array, returning false if there is a match.
	#
	# The second constraint divides the passed value by each value in 
	# the input_array and compares the result against the input_array,
	# returning false if there is a match.
	# * *ARGS* :
	# 	num - the integer value to be tested
	# 	input_array - the existing numbers to be tested against
	# * *Returns* :
	# 	TRUE - if num passes constraints
	# 	FALSE - if num fails to pass constraints
#
def multiple?(num, input_array)
	bad = false
	# check to be sure that num * [an array element] != [an array element]
	input_array.each do |i|
		res = i * num
		input_array.each do |j|
			if (res == j)
				bad = true
			end
		end
	end
	# check that num / [an array element] != [an array element]
	# order numbers so that a smaller number by a larger number
	input_array.each do |i|
		if (i > num)
			res = i.to_f / num.to_f
		else
			res = num.to_f / i.to_f
		end
		if (res == res.to_i) # is it a whole number?
			input_array.each do |j|
				if (res == j.to_f)
					bad = true 
				end
			end
		end
	end
	return bad
end

### D U P L I C A T E S ?  ##########################################
	# Checks in input number against the values in
	# input_array, returning false if there is a match.
	# * *ARGS* :
	# 	num - the integer value to be tested
	# 	input_array - the existing numbers to be tested against
	# * *Returns* :
	# 	TRUE - if num does not match existing elements
	# 	FALSE - if num is a duplicate value
# 
def duplicate?(num, input_array)
	status = false

	input_array.each do |i|
		if num == i 
			status = true
		end
	end
	return status
end





###  M A I N  ######################################################

# create arithmatic tiles
	create_tiles

# create times table tiles
	create_times_table

# fin