require 'test_helper'

class Admin::ArticlesControllerTest < ActionController::TestCase
  test "edit" do
    login_as("admin")

    article = Factory(:article)
    get :edit, topic_id: article.topic, id: article
    assert_response :success
  end

  test "update" do
    login_as("admin")

    article = Factory(:article)
    put :update, topic_id: article.topic, id: article, article: Factory.attributes_for(:article)
    assert_redirected_to [:admin, article.topic]
  end

  test "fail to update" do
    login_as("admin")

    attrs = Factory.attributes_for(:article, poster: "")
    article = Factory(:article)
    put :update, topic_id: article.topic, id: article, article: attrs
    assert_response :success
    assert_template "edit"
  end

  test "destroy" do
    login_as("admin")

    article = Factory(:article)
    delete :destroy, topic_id: article.topic, id: article
    assert_redirected_to [:admin, article.topic]
    assert_raise(ActiveRecord::RecordNotFound) {
      Article.find(article.id)
    }
  end
end
