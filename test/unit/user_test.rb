require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save 

  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save 

  	assert !user.errors[:last_name].empty?
  end


  test "a user should enter a title" do
  	user = User.new
  	assert !user.save 

  	assert !user.errors[:title].empty?
  end

  test "a user should enter a correctly formatted title" do
    user = User.new(first_name: 'Jason', last_name: 'Basin', 
      email: 'jason@basin.com' ) 
    user.password = user.password_confirmation = 'password'
    user.title = 'Director_General'
    assert !user.valid? 
  end


end
