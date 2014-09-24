class Topic < ActiveRecord::Base
  attr_accessible :title, :articles_attributes

  has_many :articles

  accepts_nested_attributes_for :articles

  paginates_per 10

  validates :title,
    presence: true,
    length: { minimum: 5, maximum: 100 }
end
