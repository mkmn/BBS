require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  test "index" do
    10.times { 
      Factory(:topic)
    }
    get :index
    assert_response :success
    assert_equal 10, assigns[:topics].count
  end

  test "show" do
    topic = Factory(:topic_articles)

    get :show, id: topic
    assert_response :success
    assert_equal 10, assigns[:topic].articles.count
    assert_select ".article", 10
  end

  test "new" do
    get :new
    assert_response :success
  end
end
