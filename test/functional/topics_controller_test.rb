require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  test "index" do
    10.times { Factory(:topic) }
    get :index
    assert_response :success
    assert_equal 10, assigns[:topics].count
  end
end
