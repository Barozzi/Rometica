class GameController < ApplicationController
  def easy
	  	@tile = Tile.find(rand(1..Tile.count))
	  	@game_array = [@tile.t1, @tile.t2, @tile.t3, 
	  					@tile.t4, @tile.t5]

	  	@key = @game_array[0]
	  	@game_array.shuffle!
	end
	  

  def hard
	  	@tile = Tile.find(rand(1..Tile.count))
	  	@game_array = [@tile.t1, @tile.t2, @tile.t3, 
	  					@tile.t4, @tile.t5, @tile.t6,
	  					@tile.t7, @tile.t8, @tile.t9]

	  	@key = @game_array[0]
	  	@game_array.shuffle!
	end

  def times
  @tile = Times.find(rand(1..Times.count))
	  	@game_array = [@tile.t1, @tile.t2, @tile.t3, 
	  					@tile.t4, @tile.t5]

	  	@key = @game_array[0]
	  	@game_array.shuffle!
	end

  def about
  end

end
