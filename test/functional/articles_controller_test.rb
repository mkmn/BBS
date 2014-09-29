require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "create" do
    topic = Factory(:topic)

    post :create, topic_id: topic, article: Factory.attributes_for(:article)
    article = assigns[:article]
    assert_redirected_to topic
  end

  test "fail to create" do
    post :create, topic_id: Factory(:topic), article: Factory.attributes_for(:article, poster: "")
    assert_response :success
    assert_template "topics/show"
  end
end
