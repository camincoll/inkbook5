require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   test "a project should have a name" do
  	project = Project.new
  	assert !project.save 

  	assert !project.errors[:name].empty?
  end

  test "a project should have a unique name" do
  	project = Project.new
  	project.name = 'Project X'
  	assert !project.save 
  	puts project.errors.inspect
  	assert !project.errors[:name].empty?
  end

end
