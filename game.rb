class Game
	attr_accessor :rows, :cols, :grid, :active_player

	def start_game
		@rows = 6
		@cols = 7
		@grid = Array.new(rows) {Array.new(cols)}
		for i in 0...@rows
			for j in 0...@cols
				@grid[i][j] = 0
			end
		end
		@active_player = 1
	end

	def switch_player
		@active_player == 1 ? @active_player = 2 : @active_player = 1
	end

	def insert_into(index)
		return false if index > @cols || index < 1

		previous = -1
		for i in 0...@rows
			break if @grid[i][index-1] == 1 || @grid[i][index-1] == 2
			previous = i
		end

		return false if previous == -1
		@grid[previous][index-1] = @active_player
	end

	# Returns the id of the player who won. or 3 if it's a draw?
	def game_over?
		count = 0
		# Check the columns
		for i in 0...@cols
			for j in 0...@rows
				break if count == 4
				if @grid[j][i] == @active_player
					count += 1
				else
					count = 0
				end
			end
		end
		return @active_player if count >= 4

		# Check the rows
		count = 0
		for i in 0...@rows
			for j in 0...@cols
				break if count == 4
				if @grid[i][j] == @active_player
					count += 1
				else
					count = 0
				end
			end
		end
		return @active_player if count >= 4

		# TODO: Merge left and right diagonal in a single loop, to reduce time of checking victory conditions
		# Right diagonal
		count = 0
		for i in 0...@rows
			for j in 0...@cols
				if i+3 < @rows && j+3 < @cols
					sub_matrix = Game::get_sub_matrix(@grid,i,j,i+3,j+3)
					for z in 0...sub_matrix.count
						for k in 0...sub_matrix[0].count
							next unless z == k
							break if count == 4
							if sub_matrix[z][k] == @active_player
								count += 1
							else
								count = 0
							end
						end
					end
				end
				break if count == 4
				count = 0
			end
		end
		return @active_player if count >= 4

		# Left diagonal
		count = 0
		for i in 0...@rows
			for j in 0...@cols
				if i+3 < @rows && j+3 < @cols
					sub_matrix = Game::get_sub_matrix(@grid,i,j,i+3,j+3)
					for z in 0...sub_matrix.count
						for k in 0...sub_matrix[0].count
							next unless z == sub_matrix[0].count-1 - k
							break if count == 4
							if sub_matrix[z][k] == @active_player
								count += 1
							else
								count = 0
							end
						end
					end
					break if count == 4
					count = 0
				end
			end
		end
		return @active_player if count >= 4

		# Draw
		arr = []
		@grid.each do |row|
			row.each do |element|
				arr << element
			end
		end
		return 3 unless arr.any? {|e| e == 0}

		# Game is still on
		return false
	end

	def render_grid
		for i in 0...@rows
			print "\t\t\t"
			@cols.times do |i| 
				print "----"
				print "-" if i == @cols-1
			end
			print "\n\t\t\t"
			for j in 0...@cols
				case grid[i][j]
				when 0 then current = " "
				when 1 then current = "x"
				when 2 then current = "o"
				end
				print "| " + current + " "
				print "|" if j == @cols-1
			end
			print "\n"
		end
		print "\t\t\t"
		@cols.times do |i| 
			print "----"
			print "-" if i == @cols-1
		end
		print "\n"
		print "\t\t\t  "
		@cols.times do |i|
			print "#{i+1}"
		    print "   " unless i == @cols - 1
		end
		print "\n"
	end

	def self.get_sub_matrix(matrix,p1x,p1y,p2x,p2y)
		sub_matrx = Array.new(p2x-p1x+1) { Array.new(p2y-p1y+1) }
		z, k = 0, 0
		for i in p1x..p2x
			k = 0
			for j in p1y..p2y
				sub_matrx[z][k] = matrix[i][j]
				k += 1
			end
			z += 1
		end
		sub_matrx
	end

	# Used for debug, displays the given matrix
	private
	def display(matrix)
		for i in 0...matrix.count
			for j in 0...matrix[0].count
				print "#{matrix[i][j]} "
			end
			print "\n"
		end

		puts
	end
end

# Game
=begin
game = Game.new
game.start_game
loop do
	system 'clear'
	game.render_grid
	puts "It's player #{game.active_player}'s turn: "
	turn = gets.chomp.to_i
	game.insert_into(turn)
	game.switch_player
end
=end