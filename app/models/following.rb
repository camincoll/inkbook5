class Following < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user, :follower

  belongs_to :user
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'

end
