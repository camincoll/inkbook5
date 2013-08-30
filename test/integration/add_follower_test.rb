require 'test_helper'

class AddFollowerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def sign_in_as(user, password)
  	post login_path, user: {email: user.email, password: password }
  end

  test "adding a follower works" do
  	sign_in_as users(:jason), "testing"

  	get "/followings/new?follower_id=#{users(:jim).profile_name}"
  	assert_response :success

  	assert_difference 'Following.count' do
  		post "/followings", following: { follower_id: users(:jim).profile_name}
  		assert_response :redirect
  		assert_equal "You are now following #{users(:jim).full_name}", flash[:success]
  	end
  end
end
