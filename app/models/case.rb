class Case < ApplicationRecord

  belongs_to :user
has_many :favorites, :dependent => :destroy

has_many :fans, :through => :favorites, :source => :user
end
