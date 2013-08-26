require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a client should have a name" do
  	client = Client.new
  	assert !client.save 

  	assert !client.errors[:name].empty?
  end

  test "a client should have a unique name" do
  	client = Client.new
  	client.name = 'Optus'
  	assert !client.save 
  	puts client.errors.inspect
  	assert !client.errors[:name].empty?
  end


end
