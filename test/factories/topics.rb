FactoryGirl.define do
  factory :topic do
    sequence(:title) { |n| "Title#{n}" }

    factory :topic_articles do
      ignore do
        articles_count 10
      end

      after_create do |topic, evaluator|
        Factory.create_list(:article, evaluator.articles_count, topic: topic)
      end
    end
  end
end
