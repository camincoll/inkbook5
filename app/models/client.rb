class Client < ActiveRecord::Base
  attr_accessible :name, :project

  validates :name, presence: true, uniqueness: true

  has_many :projects
end
