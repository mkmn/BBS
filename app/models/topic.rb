class Topic < ActiveRecord::Base
  attr_accessible :title

  validates :title,
    presence: true,
    length: { minimum: 5, maximum: 100 }
end
