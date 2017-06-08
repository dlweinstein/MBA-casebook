class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => true, :uniqueness => true

  # Users belong to Business schools
  belongs_to :school

  # things that belong to Users
  has_many :cases, :class_name => "Case", :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :favorited_cases, :through => :favorites, :source => :case

  # Sent Friend requests
  has_many :sent_friend_requests, :class_name => "Friend", :foreign_key => "sender_id", :dependent => :destroy
  has_many :followings, :through => :sent_friend_requests, :source => :recipient

  # Received Friend requests
  has_many :received_friend_requests, :class_name => "Friend", :foreign_key => "recipient_id", :dependent => :destroy
  has_many :followers, :through => :received_friend_requests, :source => :sender

  # Messaging
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id", :dependent => :destroy
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id", :dependent => :destroy

end
