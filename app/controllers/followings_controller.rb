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

    def create
		if params[:following] && params[:following].has_key?(:follower_id)
			@follower = User.where(profile_name: params[:following][:follower_id]).first
			@following = current_user.followings.new(follower: @follower)
			@following.save
			redirect_to profile_path(@follower)
			flash[:success] = "You are now following #{@follower.full_name}"
		else
			flash[:error] = "Follower required"
			redirect_to root_path
		end

    end

end
