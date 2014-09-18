class Article < ActiveRecord::Base
  attr_accessible :poster, :email, :body, :topic

  belongs_to :topic

  validates :poster,
    presence: true,
    length: { maximum: 32 }
  validates :body,
    presence: true,
    length: { minimum: 5, maximum: 1000 }
end
