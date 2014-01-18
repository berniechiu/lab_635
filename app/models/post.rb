class Post < ActiveRecord::Base
  attr_accessible :link, :title

  validates :title, presence: true
end
