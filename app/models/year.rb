class Year < ActiveRecord::Base
  attr_accessible :time

  has_many :graduates

  scope :by_current_lab_graduates, ->(current_year) { where("time >= ? AND time <= ?",current_year - 2, current_year) }
end
