require 'spec-helper'

describe game_controller do 

	context hard do 
		# before(:each) do 
			# @game_array = hard
		# end
		it 'should return an array @game_array' do  
      @game_array.class.should eq(Array)
    end

    it 'should provide a key as @key' do 
    	@key.class.should eq(Fixnum)
    end

    it 'should have at least one solution' do 
    	solution = false
    	permutation_array = @game_array.permutation
			permutation_array.each do |array|
				solution = true if @key == (array[0] + array[1])
			end
			solution.should eq(true)
		end
	end
end