require 'test_helper'

class Admin::TopicsControllerTest < ActionController::TestCase
  test "before login" do
    get :index
    assert_response 403
  end

  test "index" do
    login_as("admin")

    10.times {
      Factory(:topic)
    }

    get :index
    assert_response :success
    assert_equal 10, assigns[:topics].count
  end

  test "show" do
    login_as("admin")

    topic = Factory(:topic_articles)

    get :show, id: topic
    assert_response :success
    assert_equal 10, assigns[:topic].articles.count
  end

  test "edit" do
    login_as("admin")

    topic = Factory(:topic)
    get :edit, id: topic
    assert_response :success
  end

  test "update" do
    login_as("admin")

    topic = Factory(:topic)
    put :update, id: topic, topic: Factory.attributes_for(:topic)
    assert_redirected_to [:admin, topic]
  end

  test "fail to update" do
    login_as("admin")

    attrs = Factory.attributes_for(:topic, title: "")
    topic = Factory(:topic)
    put :update, id: topic, topic: attrs
    assert_response :success
    assert_template "edit"
  end

  test "destroy" do
    login_as("admin")

    topic = Factory(:topic)
    delete :destroy, id: topic
    assert_redirected_to [:admin, :topics]
    assert_raise(ActiveRecord::RecordNotFound) {
      Topic.find(topic.id)
    }
  end
end
