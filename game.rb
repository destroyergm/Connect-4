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
