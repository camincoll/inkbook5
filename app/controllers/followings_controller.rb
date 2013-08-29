class FollowingsController < ApplicationController

	before_filter :authenticate_user!, only: [:new]

	def new
		if params[:follower_id]
			@follower = User.where(profile_name: params[:follower_id]).first
			raise ActiveRecord::RecordNotFound if @follower.nil?
			@following = current_user.followings.new(follower: @follower)
		else
			flash[:error] = "Follower required"
		end
	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
    end

end
