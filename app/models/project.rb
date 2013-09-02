class Project < ActiveRecord::Base
  attr_accessible :description, :end, :start, :name, :value, :client_id

  validates :name, presence: true, uniqueness: true

  belongs_to :client

  has_many :roles, :dependent => :destroy

end
