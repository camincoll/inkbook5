require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that the content is at least two letters long" do
  	status = Status.new
  	status.content = "a"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "statuses have a user_id" do
  	status = Status.new
  	status.content = "Hello"
  	assert !status.save
  	assert !status.errors[:user_id].empty?

  end

  test "statuses can be saved when we have a user_id" do
  	status = Status.new
  	status.content = "Hello"
  	status.user_id = "1"
  	assert status.save
  end

end
