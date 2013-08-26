class Project < ActiveRecord::Base
  attr_accessible :description, :end, :start, :name, :value

  validates :name, presence: true, uniqueness: true
end
