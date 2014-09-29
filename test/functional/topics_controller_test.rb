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
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    post :create, topic: Factory.attributes_for(:topic)
    topic = assigns[:topic]
    assert_redirected_to :topics
  end

  test "fail to create" do
    attrs = Factory.attributes_for(:topic, title: "")
    post :create, topic: attrs
    assert_response :success
    assert_template "new"
  end

  test "pagination" do
    20.times {
      Factory(:topic)
    }
    get :index
    assert_response :success
    assert_equal 10, assigns[:topics].count
  end
end
