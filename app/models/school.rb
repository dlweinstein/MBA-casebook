class School < ApplicationRecord
  has_many :users, :class_name => "User", :dependent => :destroy

  has_many :cases, :through => :users



end
