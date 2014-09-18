require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "presence" do
    article = Article.new

    assert article.invalid?
    assert article.errors.include?(:poster)
    assert article.errors.include?(:body)
  end

  test "length" do
    article = Factory.build(:article)

    #poster文字列長が32を超えるなら偽
    article.poster = "A" * 33
    #body文字列長が1000を超えるなら偽
    article.body = "A" * 1001
    assert article.invalid?
    assert article.errors.include?(:poster)
    assert article.errors.include?(:body)

    #poster文字列長が32以内なら真
    article.poster = "A" * 32
    #body文字列長が1000以内なら真
    article.body = "A" * 1000
    assert article.valid?

    #body文字列長が5未満なら偽
    article.body = "A" * 4
    assert article.invalid?
    assert article.errors.include?(:body)

    #body文字列長が5以上なら真
    article.body = "A" * 5
    assert article.valid?
  end
end
