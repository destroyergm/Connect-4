require_relative "../game.rb"

describe Game do
	let(:game) { Game.new }

	describe "#start_game" do

		it "Initializes the rows to 6" do
			game.start_game
			expect(game.rows).to eql 6
		end
		it "Initializes the colums to 7" do
			game.start_game
			expect(game.cols).to eql 7
		end
		it "Initializes the grid to empty" do
			game.start_game
			expect(game.grid).to eql [
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0]
			]
		end

		it "Sets the active player to 1" do
			game.start_game
			expect(game.active_player).to eql 1
		end
	end

	describe "#switch_player" do
		context "Last turn was player1's" do
			it "Changes the active player to 2" do
				game.active_player = 1
				game.switch_player
				expect(game.active_player).to eql 2
			end
		end

		context "Last turn was player2's" do
			it "Changes the active player to 1" do
				game.active_player = 2
				game.switch_player
				expect(game.active_player).to eql 1
			end
		end
	end

	describe "#render_grid" do
		context "Renders an empty grid to the screen" do
			it "Outputs the grid to the screen" do

			game.rows = 6
			game.cols = 7
			game.grid = 
			[
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0]
			]
			expect{game.render_grid}.to output(
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t  1   2   3   4   5   6   7\n").to_stdout
			end
		end

		context "Renders filled grid to the screen" do
			it "Outputs the first filled row to the screen" do
				game.rows = 6
			game.cols = 7
			game.grid = 
			[
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[1,2,1,2,1,2,1]
			]
			expect{game.render_grid}.to output(
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t|   |   |   |   |   |   |   |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t| x | o | x | o | x | o | x |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t  1   2   3   4   5   6   7\n").to_stdout
			end
			it "Outputs randomly filled grid at screen" do
				game.rows = 6
			game.cols = 7
			game.grid = 
			[
				[1,1,2,1,2,1,2],
				[2,2,1,2,2,1,2],
				[1,2,1,2,2,2,1],
				[2,1,1,1,2,2,1],
				[2,1,2,1,2,1,2],
				[1,2,1,2,1,2,1]
			]
			expect{game.render_grid}.to output(
								"\t\t\t-----------------------------\n"+
								"\t\t\t| x | x | o | x | o | x | o |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t| o | o | x | o | o | x | o |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t| x | o | x | o | o | o | x |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t| o | x | x | x | o | o | x |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t| o | x | o | x | o | x | o |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t| x | o | x | o | x | o | x |\n"+
								"\t\t\t-----------------------------\n"+
								"\t\t\t  1   2   3   4   5   6   7\n").to_stdout
			end
		end
	end


end