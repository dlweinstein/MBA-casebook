class Favorite < ApplicationRecord

belongs_to :user
belongs_to :case

validates :user, :presence => true
validates :case, :presence => true, :uniqueness => { :scope => :user }
end
