require 'test_helper'

class FollowingsControllerTest < ActionController::TestCase
  
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
			
			should "get new and return success" do
				get :new
				assert_response :success
			end
			
			should "set a flash error if the follower_id params is missing" do
				get :new, {}
				assert_equal "Follower required", flash[:error]
			end

			should "find the follower and display the name" do
				get :new, follower_id: users(:jim)
				assert_match /#{users(:jim).full_name}/, response.body
			end

			should "assign a new user follower" do
				get :new, follower_id: users(:jim)
				assert assigns(:following)
			end

			should "assign a new user follower to correct friend" do
				get :new, follower_id: users(:jim)
				assert_equal users(:jim), assigns(:following).follower
			end

			should "assign a new user follower to the currently logged in user" do
				get :new, follower_id: users(:jim)
				assert_equal users(:jason), assigns(:following).user
			end

			should "returns 404 status if no friend is found" do
				get :new, follower_id: 'invalid'
				assert_response :not_found
			end

			should "ask do you really want to follow this user" do
				get :new, follower_id: users(:jim)
				assert_match /Do you really want to follow #{users(:jim).full_name}/, response.body
			end
		end
  	end

  	context "#create" do
  		context "when not logged in" do
  			should "redirect to login page" do
  				get :new
  				assert_response :redirect
  				assert_redirected_to login_path
			end
		end

		context "when logged in" do
			setup do
				sign_in users(:jason)
			end
		
			context "with no follower id" do
				setup do
					post :create
				end

				should "set the flash error message" do
					assert !flash[:error].empty?
				end
				should "get redirected to root path" do
					assert_redirected_to root_path
				end
			end

			context "with valid follower id" do
				setup do
					post :create, following: { follower_id: users(:mike) }
				end

				should "assign the follower" do
					assert assigns(:follower)
					assert_equal users(:mike), assigns(:follower)

				end

				should "also assign the following object" do
					assert assigns(:following)
					assert_equal users(:jason), assigns(:following).user
					assert_equal users(:mike), assigns(:following).follower
				end

				should "create a following" do
					assert users(:jason).followers.include?(users(:mike))
				end

				should "also redirect to follower" do
	  				assert_response :redirect
	  				assert_redirected_to profile_path(users(:mike))
				end

				should "set the flash message that we're following" do
					assert flash[:success]
					assert_equal "You are now following #{users(:mike).full_name}", flash[:success]
				end
			end
		end
	end

end
