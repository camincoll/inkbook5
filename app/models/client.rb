class Client < ActiveRecord::Base
  attr_accessible :name, :project, :abn

  validates :name, presence: true, uniqueness: true
  validates_format_of :abn, :on => :create, :with => /(?:^|\D)\d{9}(?:\D|$)/

  has_many :projects
end
