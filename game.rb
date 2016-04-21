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
end