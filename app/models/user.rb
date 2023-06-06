class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, inverse_of: 'creater'
  has_many :user_attendances
  has_many :attended_events, through: :user_attendances, source: :event
end
