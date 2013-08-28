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

  should have_many(:followings)
  should have_many(:followers)

  test "that no error is raised when trying to access the follower list" do
    assert_nothing_raised do
      users(:jason).followers  
    end
  end

  test "that creating a following on a user works" do
    assert_nothing_raised do
      users(:jason).followers << users(:mike)
      users(:jason).followers.reload
      assert users(:jason).followers.include?(users(:mike))
    end
  end
end
