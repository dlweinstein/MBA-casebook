class Case < ApplicationRecord

  belongs_to :user

  has_many :schools, :through => :users
  has_many :favorites, :dependent => :destroy
  has_many :fans, :through => :favorites, :source => :user

  validates :user, :presence => true  
  validates :case_type, :presence => true

  validates :industry, :presence => true
  validates :page, :presence => true
  validates :name, :presence => true

  validates :quant, :presence => true
  validates :structure, :presence => true

end
