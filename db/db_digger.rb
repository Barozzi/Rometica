# RUN ME FROM COMMAND LINE

# It prints the values from both data-tables and formats the records as 
# an array of hashes for use as in-line code to eliminate DB access
#


require 'rubygems'
require 'rspec'
require 'sequel'

DB = Sequel.sqlite('development.sqlite3')
addition_array = []
multiplication_array = []


def get_addition
	tiles = DB[:Tiles]
  return tiles.all
end

def get_multiplication
  tiles = DB[:Times]
  return tiles.all
end

def format_data
  # returns a string literal that defines a Ruby hash
  # TODO: clip th non-essential lements ie date-time
  multiplication = []
  addition = []

  get_addition.each do |record|
    addition << record.values_at(:t1, :t2, :t3, :t4, :t5, :t6,:t7, :t8, :t9)
  end

  get_multiplication.each do |record|
    multiplication << record.values_at(:t1, :t2, :t3, :t4, :t5, :t6,:t7, :t8, :t9)
  end

  p addition
  p multiplication
end


describe get_addition do 
  before(:each) do 
  	@value = get_addition
  end
  it 'should return an array' do 
    @value.class.should eq(Array)
  end
  it 'should return an array of hashes' do 
  	@value.each {|e| e.class.should eq(Hash)}
  end
end

describe get_multiplication do 
	before(:each) do 
  	@value = get_multiplication
  end
  it 'should return an array' do 
    @value.class.should eq(Array)
  end
  it 'should return an array of hashes' do 
  	@value.each {|e| e.class.should eq(Hash)}
  end
end

describe format_data do 
	before(:each) do
		@value = format_data(get_multiplication(DB))
	end
  it 'should return a string' do 
  	@value.class.should eq(String)
  end
end