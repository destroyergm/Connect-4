require_relative "../game.rb"

describe "Game" do
	let(:game) { Game.new }

	describe "#start_game" do
		it "Initializes the game start data" do
			game.start_game
			expect(game.rows).to eql 6
			expect(game.cols).to eql 7
			expect(game.grid).to eql [
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0],
				[0,0,0,0,0,0,0]
			]
		end
	end
end