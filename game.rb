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

		# TODO: Check the diagonals
		
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