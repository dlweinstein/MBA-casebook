class School < ApplicationRecord
  has_many :students, :class_name => "User", :dependent => :destroy
end
