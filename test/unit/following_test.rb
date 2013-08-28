require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:follower)

  	test "that creating a follower works without raising an exception" do
  		assert_nothing_raised do
  			Following.create user: users(:jason), follower: users(:jim)
  		end
	end
end
