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

  test "a user should have a profile name without spaces" do
    user = User.new
    user.profile_name = 'A name with spaces'


    assert !user.save 
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("must be formatted correctly.")

  end


  test "a user should enter a correctly formatted profile_name" do
    user = User.new(first_name: 'Jason', last_name: 'Basin', 
      email: 'jason@cam.com', title: 'Director' ) 
    user.password = user.password_confirmation = 'password'
    user.profile_name = 'DirectorGeneral'
    assert user.valid? 
  end


end
