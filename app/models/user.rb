class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image
  validates :name, presence: true, length: { in: 2..20 }
  validates :profile, length: { maximum: 50 }
end