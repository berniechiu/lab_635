class Graduate < ActiveRecord::Base
  attr_accessible :email, :name, :year_id

  belongs_to :year
end
