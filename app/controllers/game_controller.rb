class GameController < ApplicationController
  def easy
	  	@game_array = Tile.selection.take(5)
	  	@key = @game_array[0]
	  	@game_array.shuffle!
	end
	  

  def hard
	  @game_array = Tile.selection
	  @key = @game_array[0]
	  @game_array.shuffle!
	end

  def times
  	@game_array = Times.selection.take(5)

  	@key = @game_array[0]
  	@game_array.shuffle!
	end

  def times_hard 
  	@game_array = Times.selection
  	@key = @game_array[0]
  	@game_array.shuffle!
	 end
  
  def about
  end

end
