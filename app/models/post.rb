class Post < ActiveRecord::Base
  attr_accessible :link, :title

  VALID_LINK_REGEX = /^http:\/\/.+/i

  validates :title, presence: true
  validates :link, format: { with: VALID_LINK_REGEX }, allow_blank: true
end
