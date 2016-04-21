require_relative "game.rb"

game = Game.new
game.start_game
t = true
loop do
	system 'clear'
	game.render_grid
	print "Enter input for #{game.active_player}: "
	loop do
		input = gets.chomp.to_i
		break if game.insert_into(input)
	end
	break if t = game.game_over?
	game.switch_player
end
game.render_grid
puts "Player 1 won the game" if t == 1
puts "Player 2 won the game" if t == 2
puts "It was a draw" if t == 3