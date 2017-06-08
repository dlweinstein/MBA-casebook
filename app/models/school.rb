class School < ApplicationRecord
  has_many :users, :class_name => "User", :dependent => :destroy
  has_many :cases, :through => :users

  validates :name, :presence => true, :uniqueness => true

end
