class Work < ActiveRecord::Base
  attr_accessible :title

  belongs_to :category
  validates :title, presence: true

  scope :by_newest, order("created_at DESC")
  default_scope by_newest
end
