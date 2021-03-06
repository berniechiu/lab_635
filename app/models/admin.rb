class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password
  # attr_accessible :title, :body
end