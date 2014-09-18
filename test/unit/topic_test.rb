require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  test "presence" do
    topic = Topic.new
    assert topic.invalid?
    assert topic.errors.include?(:title)
  end

  test "length" do
    topic = Factory.build(:topic)
    
    #title文字列長が100を超えるなら偽
    topic.title = "A" * 101
    assert topic.invalid?
    assert topic.errors.include?(:title)

    #title文字列長が100以内なら真
    topic.title = "A" * 100
    assert topic.valid?

    #title文字列長が5未満なら偽
    topic.title = "A" * 4
    assert topic.invalid?
    assert topic.errors.include?(:title)

    #title文字列長が5以上なら真
    topic.title = "A" * 5
    assert topic.valid?
  end
end
