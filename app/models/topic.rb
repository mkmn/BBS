class Topic < ActiveRecord::Base
  attr_accessible :title

  has_many :articles

  validates :title,
    presence: true,
    length: { minimum: 5, maximum: 100 }
end
