class Equipment < ActiveRecord::Base
  attr_accessible :amount, :title
  
  validates :title, presence: true
  validates :amount, presence: true
end
