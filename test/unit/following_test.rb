require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:follower)

  	test "that creating a follower works without raising an exception" do
  		assert_nothing_raised do
  			Following.create user: users(:jason), follower: users(:mike)
  		end
	end

	test "that creating a following based on user id and follower id works" do
    	Following.create user_id: users(:jason).id, follower_id: users(:mike).id
      	assert users(:jason).followers.include?(users(:mike))

  	end


end
