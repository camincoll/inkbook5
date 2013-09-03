require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

    context "#new" do
		context "when not logged in" do
			should "redirected to the login page" do
				get :new
				assert_response :redirect
		  	end
		end
		context "when logged in" do
			setup do
				sign_in users(:jason)
			end
		end
	end
end
